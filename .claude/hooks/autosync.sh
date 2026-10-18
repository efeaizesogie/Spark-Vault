#!/usr/bin/env bash
# Stop hook: commit any leftover changes and push them to GitHub.
# Safety net only; Claude normally commits with a descriptive message first (see CLAUDE.md).
cd "${CLAUDE_PROJECT_DIR:-.}" || exit 0
git rev-parse --is-inside-work-tree >/dev/null 2>&1 || exit 0

if [ -n "$(git status --porcelain)" ]; then
  git add -A
  git commit -q -m "Auto-sync: $(date '+%Y-%m-%d %H:%M')" || exit 0
fi

# Push only when local main is ahead of GitHub.
if [ -n "$(git log '@{u}..HEAD' --oneline 2>/dev/null)" ]; then
  if git push -q origin HEAD 2>/dev/null; then
    echo '{"systemMessage":"Spark Vault synced to GitHub"}'
  else
    echo '{"systemMessage":"Spark Vault: push to GitHub failed. Check your connection or credentials."}'
  fi
fi
exit 0
