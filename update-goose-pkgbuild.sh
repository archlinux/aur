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
    exit 0
fi

# Find the .deb asset and its SHA256 digest from the API
ASSET_NAME="goose_${LATEST_VERSION}_amd64-vulkan.deb"
echo -e "${GREEN}Looking for asset: ${YELLOW}${ASSET_NAME}${NC}"

# Extract the digest for the specific .deb file
# GitHub API returns digest in format "sha256:HASH"
DIGEST=$(echo "$RELEASE_DATA" | jq -r ".assets[] | select(.name == \"${ASSET_NAME}\") | .digest")

if [[ -z "$DIGEST" || "$DIGEST" == "null" ]]; then
    echo -e "${RED}Error: Could not find SHA256 digest for ${ASSET_NAME}${NC}"
    echo -e "${YELLOW}Note: GitHub only provides digests for newly published releases.${NC}"
    echo -e "${YELLOW}For older releases, you may need to download and calculate the hash.${NC}"
    exit 1
fi

# Remove the "sha256:" prefix to get just the hash
SHA256=$(echo "$DIGEST" | sed 's/^sha256://')

echo -e "${GREEN}SHA256: ${YELLOW}${SHA256}${NC}"

# Update PKGBUILD
echo -e "${GREEN}Updating PKGBUILD...${NC}"

# Update pkgver
sed -i "s/^pkgver=.*/pkgver=${LATEST_VERSION}/" "$PKGBUILD_FILE"

# Reset pkgrel to 1
sed -i "s/^pkgrel=.*/pkgrel=1/" "$PKGBUILD_FILE"

# Update sha256sums
sed -i "s/^sha256sums=.*/sha256sums=('${SHA256}')/" "$PKGBUILD_FILE"

# Generate .SRCINFO automatically after any PKGBUILD changes
echo -e "${GREEN}Generating .SRCINFO...${NC}"
makepkg --printsrcinfo | tee .SRCINFO

echo -e "${GREEN}✓ PKGBUILD updated successfully!${NC}"
echo -e "${GREEN}✓ .SRCINFO generated successfully!${NC}"
echo ""
echo -e "${YELLOW}Changes:${NC}"
echo -e "  Version: ${CURRENT_VERSION} → ${LATEST_VERSION}"
echo -e "  SHA256:  ${SHA256}"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo "  1. Review changes: git diff PKGBUILD .SRCINFO"
echo "  2. Test build: makepkg -si"
echo "  3. Commit: git add PKGBUILD .SRCINFO && git commit -m 'upgpkg: ${LATEST_VERSION}'"
echo "  4. Push: git push"
