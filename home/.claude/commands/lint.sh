#!/bin/bash
# Runs after every Claude turn. Lints + formats changed files.

CHANGED=$(git diff --name-only HEAD)
for f in $CHANGED; do
  case "$f" in
    *.py)       ruff check --fix "$f" && black "$f" ;;
    *.tf)       terraform fmt "$f" ;;
    *.go)       gofmt -w "$f" ;;
    *.yaml|*.yml) yamllint "$f" ;;
  esac
done
