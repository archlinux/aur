#!/usr/bin/env bash
# Mistral Vibe Version Check Script
# Compares current PKGBUILD version with latest GitHub release

set -euo pipefail

REPO="mistralai/mistral-vibe"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PKGBUILD_PATH="$SCRIPT_DIR/PKGBUILD"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║        Mistral Vibe Version Check                         ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""

if ! command -v jq &>/dev/null; then
    echo -e "${RED}Error: jq required. Install: sudo pacman -S jq${NC}"
    exit 1
fi

echo -e "${BLUE}→${NC} Fetching latest release..."
LATEST_VERSION=$(curl -sL "https://api.github.com/repos/${REPO}/releases/latest" | jq -r '.tag_name' | sed 's/^v//')

if [[ -z "$LATEST_VERSION" || "$LATEST_VERSION" == "null" ]]; then
    echo -e "${RED}✗ Failed to fetch version${NC}"
    exit 1
fi

CURRENT_VERSION=$(grep '^pkgver=' "$PKGBUILD_PATH" | cut -d'=' -f2)

echo -e "  Current: ${YELLOW}${CURRENT_VERSION}${NC}"
echo -e "  Latest:  ${GREEN}${LATEST_VERSION}${NC}"
echo ""

if [[ "$LATEST_VERSION" == "$CURRENT_VERSION" ]]; then
    echo -e "${GREEN}✓ Up to date!${NC}"
    exit 0
else
    echo -e "${YELLOW}⚠ Update available: ${CURRENT_VERSION} → ${LATEST_VERSION}${NC}"
    echo -e "Run: ${BLUE}./auto-update-vibe.sh${NC}"
    exit 1
fi
