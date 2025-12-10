#!/usr/bin/env bash
# Automated Mistral Vibe Update Script
# Fetches latest version, updates PKGBUILD, and builds package

set -euo pipefail

REPO="mistralai/mistral-vibe"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PKGBUILD_PATH="$SCRIPT_DIR/PKGBUILD"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m' # No Color

echo -e "${BLUE}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║        Mistral Vibe Auto-Update Script                    ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Ensure we're in the right directory
cd "$SCRIPT_DIR"

# Check dependencies
for cmd in jq curl sed makepkg updpkgsums; do
    if ! command -v "$cmd" &>/dev/null; then
        echo -e "${RED}✗ Required command not found: $cmd${NC}"
        exit 1
    fi
done

# Fetch latest version from GitHub
echo -e "${BLUE}[1/7]${NC} Fetching latest release from GitHub..."
LATEST_VERSION=$(curl -sL "https://api.github.com/repos/${REPO}/releases/latest" | jq -r '.tag_name' | sed 's/^v//')

if [[ -z "$LATEST_VERSION" || "$LATEST_VERSION" == "null" ]]; then
    echo -e "${RED}✗ Failed to fetch latest version${NC}"
    exit 1
fi
echo -e "      Latest version: ${GREEN}$LATEST_VERSION${NC}"

# Get current version
echo -e "${BLUE}[2/7]${NC} Reading current PKGBUILD..."
CURRENT_VERSION=$(grep '^pkgver=' "$PKGBUILD_PATH" | cut -d'=' -f2)
echo -e "      Current version: ${YELLOW}$CURRENT_VERSION${NC}"

# Check if update is needed
if [[ "$LATEST_VERSION" == "$CURRENT_VERSION" ]]; then
    echo ""
    echo -e "${GREEN}✓ Already up to date!${NC}"
    exit 0
fi

# Backup PKGBUILD
echo -e "${BLUE}[3/7]${NC} Creating backup..."
cp "$PKGBUILD_PATH" "${PKGBUILD_PATH}.backup"
echo -e "      Backup saved: ${PKGBUILD_PATH}.backup"

# Update PKGBUILD
echo -e "${BLUE}[4/7]${NC} Updating PKGBUILD..."
sed -i "s/^pkgver=.*/pkgver=$LATEST_VERSION/" "$PKGBUILD_PATH"
sed -i "s/^pkgrel=.*/pkgrel=1/" "$PKGBUILD_PATH"
echo -e "      ${GREEN}✓${NC} pkgver=$LATEST_VERSION"
echo -e "      ${GREEN}✓${NC} pkgrel=1"

# Update checksums
echo -e "${BLUE}[5/7]${NC} Updating checksums..."
if updpkgsums; then
    echo -e "      ${GREEN}✓${NC} Checksums updated"
else
    echo -e "${RED}✗ Failed to update checksums${NC}"
    echo -e "Restoring backup..."
    mv "${PKGBUILD_PATH}.backup" "$PKGBUILD_PATH"
    exit 1
fi

# Regenerate .SRCINFO
echo -e "${BLUE}[6/7]${NC} Regenerating .SRCINFO..."
if makepkg --printsrcinfo > .SRCINFO; then
    echo -e "      ${GREEN}✓${NC} .SRCINFO updated"
else
    echo -e "${RED}✗ Failed to generate .SRCINFO${NC}"
    echo -e "Restoring backup..."
    mv "${PKGBUILD_PATH}.backup" "$PKGBUILD_PATH"
    exit 1
fi

# Test build
echo -e "${BLUE}[7/7]${NC} Testing build..."
if makepkg -f; then
    echo -e "      ${GREEN}✓${NC} Build successful"
else
    echo -e "${RED}✗ Build failed${NC}"
    echo -e "Restoring backup..."
    mv "${PKGBUILD_PATH}.backup" "$PKGBUILD_PATH"
    exit 1
fi

# Success summary
echo ""
echo -e "${GREEN}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║                  UPDATE SUCCESSFUL!                        ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "  ${BOLD}Updated from:${NC} $CURRENT_VERSION → ${GREEN}$LATEST_VERSION${NC}"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo -e "  1. Review changes:"
echo -e "     ${BLUE}git diff${NC}"
echo -e ""
echo -e "  2. Test installation:"
echo -e "     ${BLUE}sudo pacman -U mistral-vibe-bin-hardened-$LATEST_VERSION-1-x86_64.pkg.tar.zst${NC}"
echo -e ""
echo -e "  3. Commit and push to AUR:"
echo -e "     ${BLUE}git add PKGBUILD .SRCINFO${NC}"
echo -e "     ${BLUE}git commit -m 'Update to v$LATEST_VERSION'${NC}"
echo -e "     ${BLUE}git push${NC}"
echo ""

# Remove backup on success
rm -f "${PKGBUILD_PATH}.backup"
