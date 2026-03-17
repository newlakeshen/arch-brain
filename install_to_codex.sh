#!/usr/bin/env bash
set -euo pipefail

SKILL_NAME="arch-brain"
SKILL_DIR="$HOME/.codex/skills/$SKILL_NAME"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

case "${1:-install}" in
  install)
    mkdir -p "$SKILL_DIR"
    cp "$SCRIPT_DIR/SKILL.md" "$SCRIPT_DIR/report-template.md" "$SKILL_DIR/"
    echo -e "${GREEN}✓ arch-brain installed to $SKILL_DIR${NC}"
    echo "  Usage: /arch-brain in Codex CLI"
    ;;
  uninstall)
    if [ -d "$SKILL_DIR" ]; then
      rm -rf "$SKILL_DIR"
      echo -e "${GREEN}✓ arch-brain uninstalled${NC}"
    else
      echo -e "${RED}arch-brain is not installed${NC}"
      exit 1
    fi
    ;;
  *)
    echo "Usage: $0 [install|uninstall]"
    exit 1
    ;;
esac
