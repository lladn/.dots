#!/bin/bash
# Runs after every Claude turn. Lints + formats changed files.

# git diff paths are repo-relative; bail quietly outside a repo.
ROOT=$(git rev-parse --show-toplevel 2>/dev/null) || exit 0
cd "$ROOT" || exit 0

CHANGED=$(git diff --name-only HEAD)
for f in $CHANGED; do
  [ -f "$f" ] || continue # deleted in the diff
  case "$f" in
    *.py)       ruff check --fix "$f" && black "$f" ;;
    *.tf)       terraform fmt "$f" ;;
    *.go)       gofmt -w "$f" ;;
    *.yaml|*.yml) yamllint "$f" ;;
  esac
done
