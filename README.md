# prospects-websites

## Cold outbound skills

This project uses the [Cold Outbound Skills](https://github.com/growthenginenowoslawski/coldoutboundskills)
library of Claude Code skills for lead sourcing, copywriting, and outbound
operations.

The skills aren't committed to this repo — fetch them locally with:

```bash
scripts/download-skills.sh
```

This pulls just the `skills/` directory from the upstream repo (skipping its
large sample data zips) into `.claude/skills/`, where Claude Code picks them
up automatically.

Useful flags:

```bash
scripts/download-skills.sh --force          # re-download, overwriting what's there
scripts/download-skills.sh icp-onboarding list-builder   # fetch only specific skills
```

Requires `git`.
