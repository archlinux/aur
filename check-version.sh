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
NC='\033[0m' # No Color

echo -e "${BLUE}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║        Mistral Vibe Version Check Utility                 ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Check if jq is installed
if ! command -v jq &>/dev/null; then
    echo -e "${RED}Error: jq is required but not installed.${NC}"
    echo -e "Install it with: ${YELLOW}sudo pacman -S jq${NC}"
    exit 1
fi

# Fetch latest version from GitHub
echo -e "${BLUE}→${NC} Fetching latest release from GitHub..."
LATEST_VERSION=$(curl -sL "https://api.github.com/repos/${REPO}/releases/latest" | jq -r '.tag_name' | sed 's/^v//')

if [[ -z "$LATEST_VERSION" || "$LATEST_VERSION" == "null" ]]; then
    echo -e "${RED}✗ Failed to fetch latest version from GitHub${NC}"
    exit 1
fi

# Extract current version from PKGBUILD
echo -e "${BLUE}→${NC} Reading current PKGBUILD version..."
if [[ ! -f "$PKGBUILD_PATH" ]]; then
    echo -e "${RED}✗ PKGBUILD not found at: $PKGBUILD_PATH${NC}"
    exit 1
fi

CURRENT_VERSION=$(grep '^pkgver=' "$PKGBUILD_PATH" | cut -d'=' -f2)

# Display results
echo ""
echo -e "  Current version: ${YELLOW}${CURRENT_VERSION}${NC}"
echo -e "  Latest version:  ${GREEN}${LATEST_VERSION}${NC}"
echo ""

# Compare versions
if [[ "$LATEST_VERSION" == "$CURRENT_VERSION" ]]; then
    echo -e "${GREEN}✓ Package is up to date!${NC}"
    exit 0
else
    echo -e "${YELLOW}⚠ Update available!${NC}"
    echo ""
    echo -e "${BLUE}To update the package:${NC}"
    echo -e "  1. ${YELLOW}cd $SCRIPT_DIR${NC}"
    echo -e "  2. ${YELLOW}./auto-update-vibe.sh${NC}"
    echo ""
    echo -e "Or manually:"
    echo -e "  1. Edit PKGBUILD: ${YELLOW}pkgver=$LATEST_VERSION${NC}"
    echo -e "  2. Run: ${YELLOW}updpkgsums${NC}"
    echo -e "  3. Run: ${YELLOW}makepkg --printsrcinfo > .SRCINFO${NC}"
    echo -e "  4. Test: ${YELLOW}makepkg -f${NC}"
    echo -e "  5. Commit and push to AUR"
    exit 1
fi
