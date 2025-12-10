#!/usr/bin/env bash
# Automated Mistral Vibe Update Script

set -euo pipefail

REPO="mistralai/mistral-vibe"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PKGBUILD_PATH="$SCRIPT_DIR/PKGBUILD"

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

cd "$SCRIPT_DIR"

echo -e "${BLUE}[1/5]${NC} Fetching latest version..."
LATEST_VERSION=$(curl -sL "https://api.github.com/repos/${REPO}/releases/latest" | jq -r '.tag_name' | sed 's/^v//')
CURRENT_VERSION=$(grep '^pkgver=' "$PKGBUILD_PATH" | cut -d'=' -f2)

if [[ "$LATEST_VERSION" == "$CURRENT_VERSION" ]]; then
    echo -e "${GREEN}✓ Already up to date!${NC}"
    exit 0
fi

echo -e "${BLUE}[2/5]${NC} Updating PKGBUILD: $CURRENT_VERSION → $LATEST_VERSION"
sed -i "s/^pkgver=.*/pkgver=$LATEST_VERSION/" "$PKGBUILD_PATH"
sed -i "s/^pkgrel=.*/pkgrel=1/" "$PKGBUILD_PATH"

echo -e "${BLUE}[3/5]${NC} Generating .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO

echo -e "${BLUE}[4/5]${NC} Test build..."
makepkg -f

echo -e "${BLUE}[5/5]${NC} Done!"
echo ""
echo -e "${GREEN}Updated to v$LATEST_VERSION${NC}"
echo -e "Next: ${YELLOW}git add PKGBUILD .SRCINFO && git commit -m 'Update to v$LATEST_VERSION' && git push${NC}"
