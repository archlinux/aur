#!/usr/bin/env bash
set -euo pipefail

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

REPO="block/goose"
PKGBUILD_FILE="PKGBUILD"

echo -e "${GREEN}Fetching latest release from GitHub API...${NC}"

# Fetch latest release
RELEASE_DATA=$(curl -s "https://api.github.com/repos/${REPO}/releases/latest")

# Extract version
LATEST_VERSION=$(echo "$RELEASE_DATA" | jq -r '.tag_name' | sed 's/^v//')

if [[ -z "$LATEST_VERSION" || "$LATEST_VERSION" == "null" ]]; then
    echo -e "${RED}Error: Could not fetch latest version${NC}"
    exit 1
fi

echo -e "${GREEN}Latest version: ${YELLOW}${LATEST_VERSION}${NC}"

# Get current version
CURRENT_VERSION=$(grep '^pkgver=' "$PKGBUILD_FILE" | cut -d'=' -f2)

echo -e "${GREEN}Current version: ${YELLOW}${CURRENT_VERSION}${NC}"

if [[ "$LATEST_VERSION" == "$CURRENT_VERSION" ]]; then
    echo -e "${YELLOW}Already up to date!${NC}"
    exit 0
fi

# Update PKGBUILD
echo -e "${GREEN}Updating PKGBUILD...${NC}"

# Update pkgver
sed -i "s/^pkgver=.*/pkgver=${LATEST_VERSION}/" "$PKGBUILD_FILE"

# Reset pkgrel to 1
sed -i "s/^pkgrel=.*/pkgrel=1/" "$PKGBUILD_FILE"

# Generate .SRCINFO
echo -e "${GREEN}Generating .SRCINFO...${NC}"
makepkg --printsrcinfo | tee .SRCINFO

echo -e "${GREEN}✓ PKGBUILD updated successfully!${NC}"
echo -e "${GREEN}✓ .SRCINFO generated successfully!${NC}"
echo ""
echo -e "${YELLOW}Changes:${NC}"
echo -e "  Version: ${CURRENT_VERSION} → ${LATEST_VERSION}"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo "  1. Review changes: git diff PKGBUILD .SRCINFO"
echo "  2. Test build: makepkg -si"
echo "  3. Commit: git add PKGBUILD .SRCINFO && git commit -m 'upgpkg: ${LATEST_VERSION}'"
echo "  4. Push: git push"
