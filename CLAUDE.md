# Spark Vault

A static inspiration library: every design resource from Jack Roberts' "15 Claude Design hacks" video, grouped by kind of inspiration.

- `index.html` holds the markup and the resource data (`GROUPS`, `R`, `IMG`, `PROMPTS` in the script block).
- `styles.css` holds the styles. Colors are tokens on `:root` with dark-mode overrides; keep the palette neutral, with green only as a soft sage accent (the user found strong green hard to read).
- `shots/` holds 720×450 WebP screenshots, one per resource, keyed in `IMG`.

## Git sync (required)

The repo is connected to GitHub (`origin`, branch `main`). After every completed task:

1. `git add -A`
2. Commit with a short, descriptive message of what changed.
3. `git push origin main`

Do this without asking. If a push fails, report the error to the user.
A Stop hook (`.claude/hooks/autosync.sh`) also commits and pushes anything left uncommitted, as a fallback.
