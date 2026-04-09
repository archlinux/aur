#!/usr/bin/env bash
set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

REPO="aaif-goose/goose"
PKGBUILD_FILE="PKGBUILD"

echo -e "${GREEN}Fetching latest release from GitHub API...${NC}"

# Fetch the latest release info from GitHub API
RELEASE_DATA=$(curl -s "https://api.github.com/repos/${REPO}/releases/latest")

# Extract version (remove 'v' prefix if present)
LATEST_VERSION=$(echo "$RELEASE_DATA" | jq -r '.tag_name' | sed 's/^v//')

if [[ -z "$LATEST_VERSION" || "$LATEST_VERSION" == "null" ]]; then
    echo -e "${RED}Error: Could not fetch latest version${NC}"
    exit 1
fi

echo -e "${GREEN}Latest version: ${YELLOW}${LATEST_VERSION}${NC}"

# Get current version from PKGBUILD
CURRENT_VERSION=$(grep '^pkgver=' "$PKGBUILD_FILE" | cut -d'=' -f2)

echo -e "${GREEN}Current version: ${YELLOW}${CURRENT_VERSION}${NC}"

if [[ "$LATEST_VERSION" == "$CURRENT_VERSION" ]]; then
    echo -e "${YELLOW}Already up to date!${NC}"
else
    echo -e "${YELLOW}Updating ${CURRENT_VERSION} → ${LATEST_VERSION}${NC}"
fi

# Update PKGBUILD version
echo -e "${GREEN}Updating PKGBUILD version...${NC}"
sed -i "s/^pkgver=.*/pkgver=${LATEST_VERSION}/" "$PKGBUILD_FILE"
sed -i "s/^pkgrel=.*/pkgrel=1/" "$PKGBUILD_FILE"

# Download tarball with progress and calculate checksum
TARBALL_URL="https://github.com/${REPO}/archive/refs/tags/v${LATEST_VERSION}.tar.gz"
TARBALL_FILE="goose-desktop-${LATEST_VERSION}.tar.gz"

# Download only if missing
if [[ -f "$TARBALL_FILE" ]]; then
    echo -e "${YELLOW}Using cached tarball${NC}"
else
    echo -e "${GREEN}Downloading tarball...${NC}"
    curl -L -o "$TARBALL_FILE" "$TARBALL_URL"
fi

# Calculate b2sum
B2SUM=$(b2sum "$TARBALL_FILE" | awk '{print $1}')

# Update checksum in PKGBUILD
sed -i "s/^b2sums=.*/b2sums=('${B2SUM}')/" "$PKGBUILD_FILE"

# Generate .SRCINFO
echo -e "${GREEN}Generating .SRCINFO...${NC}"
makepkg --printsrcinfo > .SRCINFO.tmp
mv .SRCINFO.tmp .SRCINFO

echo -e "${GREEN}✓ PKGBUILD updated successfully!${NC}"
echo -e "${GREEN}✓ .SRCINFO generated successfully!${NC}"
echo ""
if [[ "$LATEST_VERSION" != "$CURRENT_VERSION" ]]; then
    echo -e "${YELLOW}Changes:${NC}"
    echo -e "  Version: ${CURRENT_VERSION} → ${LATEST_VERSION}"
    echo -e "  b2sum:   ${B2SUM}"
fi
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo "  1. Review changes: git diff PKGBUILD .SRCINFO"
echo "  2. Test build: makepkg -si"
echo "  3. Commit: git add PKGBUILD .SRCINFO && git commit -m 'upgpkg: ${LATEST_VERSION}'"
echo "  4. Push: git push"
