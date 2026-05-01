#!/usr/bin/env bash
set -euo pipefail

# Auto-merge work -> main and push when remote exists.

if ! git rev-parse --verify work >/dev/null 2>&1; then
  echo "[ERROR] branch 'work' not found"
  exit 1
fi

if git rev-parse --verify main >/dev/null 2>&1; then
  git checkout main
else
  git checkout -b main
fi

git merge --no-ff work -m "Auto-merge work into main" || true

if git remote get-url origin >/dev/null 2>&1; then
  git push origin main
  echo "[OK] merged and pushed to origin/main"
else
  echo "[WARN] merged locally, but no origin remote configured"
fi
