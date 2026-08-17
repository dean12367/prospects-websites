# CLAUDE.md

## Swann Marketing outreach email template

Used for the 18-email campaign sent 2026-08-17 from oliverfountaine@gmail.com to the
"no website" businesses in the North Yorkshire Prospects artifact
(https://claude.ai/code/artifact/4780295e-ef4d-4a16-8ca0-e8cb8969ffc2). Reuse this
structure for future batches from that list or similar prospect lists.

### Content structure (in order)

1. **Situation recognition** — open directly with a specific, verifiable fact about the
   business's reviews/reputation (star rating, review count, source — Tripadvisor,
   Yorkshire.com, Fresha, a food hygiene rating, an award, follower counts, etc.).
   No greeting prefix ("Hi", "Hello", "Hey") — start straight in.
2. **The "travesty" line** — one sentence naming it as a shame/travesty that a business
   with that reputation has no website, tied back to the specific fact just cited.
3. **Upsides of a website** — one line on what a website changes for that specific
   business (direct bookings vs. third-party widgets, showing up in local search,
   converting an Instagram/Facebook following into visits or orders) and the
   revenue/footfall/bookings upside. Avoid the literal words "profit"/"profits" and
   "sales" — say "more bookings", "more custom", "more revenue", "more footfall" instead.
4. **The offer** — "I run Swann Marketing and build secure websites for a fixed £90 fee,
   built exactly to your specification" (varied phrasing across sends, see variants below).
5. **Low-effort CTA** — one question answerable in a few words, e.g. "Would a website be
   worth having for [Business]?"
6. **Sign-off** — `Oliver` / `Swann Marketing` (no other contact details included).

### Style rules applied

- No em dashes anywhere — periods/commas only.
- No greeting prefix before a name.
- Body ~120–170 words; one paragraph per structure beat above.
- Subject line: short, factual, references the review/rating hook + "no website"
  (e.g. "your 5-star reviews, no website", "94% recommended, no website").
- Ran against the `campaign-copywriting` and `spam-word-checker` skills' banned-word
  lists — avoid: get, access, open, compare, problem, now, deal, soon, new, sales,
  urgent, life, home, extra, cash, invoice, quote, marketing (except inside the
  "Swann Marketing" sign-off itself), free, guaranteed, and all "no strings attached"
  / "no obligation" / "click here" style phrases.
- Closing-offer line was rotated across 4 near-identical phrasings so 18 sends to
  different people weren't all byte-identical:
  - A: "...built exactly to your specification, and that's the whole cost, nothing added later."
  - B: "I run Swann Marketing. I build secure websites for a fixed £90 fee, built exactly to your specification, with nothing further to pay once it's live."
  - C: "...built to your exact specification, all in, no follow-up costs."
  - D: "...built exactly how you want it, with no further costs down the line."

### Compliance note (carried over from the source artifact)

Under UK PECR, sole traders/partnerships are legally treated like individual
consumers for unsolicited marketing email (consent generally required); Ltd
companies are the safer default for cold B2B email. Check company status (the
artifact's Companies House notes) before sending to any new batch, and flag
sole-trader/unverified-email targets to the user before sending rather than
deciding unilaterally.

### Tracking

Replies are tracked in the "Email Responses" artifact
(https://claude.ai/code/artifact/31016acc-04ad-4242-80ce-f05cc2d4afdd), kept in
sync by the "Swann outreach reply watcher" trigger (checks Gmail every 3 hours,
labels processed threads `Swann Campaign/Logged`).
