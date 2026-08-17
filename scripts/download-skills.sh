#!/usr/bin/env bash
#
# Fetches the Claude Code skills from growthenginenowoslawski/coldoutboundskills
# and installs them into .claude/skills/ so they're available to Claude Code
# in this project.
#
# Only the skills/ directory is pulled (via git sparse-checkout) — the
# upstream repo also ships large sample data zips under "Common Outbound
# Lists" that this project doesn't need.
#
# Usage:
#   scripts/download-skills.sh            # fetch all skills
#   scripts/download-skills.sh <name>...  # fetch only the named skills
#   scripts/download-skills.sh --force    # re-download even if already present

set -euo pipefail

SKILLS_REPO_URL="https://github.com/growthenginenowoslawski/coldoutboundskills.git"
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DEST_DIR="${REPO_ROOT}/.claude/skills"

FORCE=0
SELECTED_SKILLS=()
for arg in "$@"; do
  if [[ "${arg}" == "--force" ]]; then
    FORCE=1
  else
    SELECTED_SKILLS+=("${arg}")
  fi
done

if [[ -d "${DEST_DIR}" && -n "$(ls -A "${DEST_DIR}" 2>/dev/null)" && "${FORCE}" -ne 1 ]]; then
  echo "Skills already present in ${DEST_DIR} (use --force to re-download). Skipping."
  exit 0
fi

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "${TMP_DIR}"' EXIT

echo "Fetching skills from ${SKILLS_REPO_URL} ..."
git clone --quiet --no-checkout --depth 1 --filter=blob:none "${SKILLS_REPO_URL}" "${TMP_DIR}/repo"
git -C "${TMP_DIR}/repo" sparse-checkout init --cone
git -C "${TMP_DIR}/repo" sparse-checkout set skills
git -C "${TMP_DIR}/repo" checkout --quiet

SRC_DIR="${TMP_DIR}/repo/skills"
if [[ ! -d "${SRC_DIR}" ]]; then
  echo "error: skills/ directory not found in ${SKILLS_REPO_URL}" >&2
  exit 1
fi

mkdir -p "${DEST_DIR}"

if [[ "${#SELECTED_SKILLS[@]}" -eq 0 ]]; then
  for skill_path in "${SRC_DIR}"/*/; do
    skill_name="$(basename "${skill_path}")"
    rm -rf "${DEST_DIR:?}/${skill_name}"
    cp -R "${skill_path}" "${DEST_DIR}/${skill_name}"
  done
else
  for skill_name in "${SELECTED_SKILLS[@]}"; do
    skill_path="${SRC_DIR}/${skill_name}"
    if [[ ! -d "${skill_path}" ]]; then
      echo "warning: no such skill '${skill_name}', skipping" >&2
      continue
    fi
    rm -rf "${DEST_DIR:?}/${skill_name}"
    cp -R "${skill_path}" "${DEST_DIR}/${skill_name}"
  done
fi

INSTALLED_COUNT="$(find "${DEST_DIR}" -mindepth 1 -maxdepth 1 -type d | wc -l | tr -d ' ')"
echo "Installed ${INSTALLED_COUNT} skill(s) into ${DEST_DIR}"
