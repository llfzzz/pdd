#!/usr/bin/env sh
set -eu

usage() {
  cat <<'EOF'
Usage: scripts/install.sh <all|zero|scope|gate> [agent]

Examples:
  scripts/install.sh all
  scripts/install.sh scope codex
  scripts/install.sh gate claude-code
EOF
}

target="${1:-}"
agent="${2:-codex}"

case "$target" in
  all)
    skill="*"
    ;;
  zero)
    skill="pdd-zero"
    ;;
  scope)
    skill="pdd-scope"
    ;;
  gate)
    skill="pdd-gate"
    ;;
  ""|-h|--help|help)
    usage
    exit 0
    ;;
  *)
    usage >&2
    exit 2
    ;;
esac

npx skills add llfzzz/pdd --skill "$skill" -g -a "$agent" -y
