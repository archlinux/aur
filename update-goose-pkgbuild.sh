#!/usr/bin/env bash
set -euo pipefail

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

REPO="block/goose"

echo -e "${GREEN}Fetching latest release...${NC}"
RELEASE_DATA=$(curl -s "https://api.github.com/repos/${REPO}/releases/latest")
LATEST_VERSION=$(echo "$RELEASE_DATA" | jq -r '.tag_name' | sed 's/^v//')

if [[ -z "$LATEST_VERSION" || "$LATEST_VERSION" == "null" ]]; then
    echo "Error: Could not fetch latest version"
    exit 1
fi

echo -e "${GREEN}Latest: ${YELLOW}${LATEST_VERSION}${NC}"

CURRENT_VERSION=$(grep '^pkgver=' PKGBUILD | cut -d'=' -f2)
echo -e "${GREEN}Current: ${YELLOW}${CURRENT_VERSION}${NC}"

if [[ "$LATEST_VERSION" == "$CURRENT_VERSION" ]]; then
    echo "Already up to date!"
    exit 0
fi

sed -i "s/^pkgver=.*/pkgver=${LATEST_VERSION}/" PKGBUILD
sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD

echo -e "${GREEN}Downloading tarball for b2sum...${NC}"
TARBALL_URL="https://github.com/${REPO}/archive/refs/tags/v${LATEST_VERSION}.tar.gz"
B2SUM=$(curl -L "$TARBALL_URL" | b2sum | awk '{print $1}')
sed -i "s|^b2sums=.*|b2sums=('${B2SUM}')|" PKGBUILD

makepkg --printsrcinfo > .SRCINFO

echo -e "${GREEN}Verifying tarball download...${NC}"
makepkg -od

echo -e "${GREEN}✓ Updated to ${LATEST_VERSION}${NC}"
echo ""
echo "Next:"
echo "  git diff PKGBUILD .SRCINFO"
echo "  makepkg -si"
