#!/usr/bin/env bash
set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

REPO="aaif-goose/goose"
PKGBUILD_FILE="PKGBUILD"

echo -e "${GREEN}Fetching latest release from GitHub API...${NC}"
RELEASE_DATA=$(curl -s "https://api.github.com/repos/${REPO}/releases/latest")
LATEST_VERSION=$(echo "$RELEASE_DATA" | jq -r '.tag_name' | sed 's/^v//')

[[ -z "$LATEST_VERSION" || "$LATEST_VERSION" == "null" ]] && {
    echo -e "${RED}Could not fetch latest version${NC}"
    exit 1
}
echo -e "  Latest:  ${YELLOW}${LATEST_VERSION}${NC}"

CURRENT_VERSION=$(grep '^pkgver=' "$PKGBUILD_FILE" | cut -d'=' -f2)
echo -e "  Current: ${YELLOW}${CURRENT_VERSION}${NC}"

if [[ "$LATEST_VERSION" == "$CURRENT_VERSION" ]]; then
    echo -e "${GREEN}Already up to date.${NC}"
    exit 0
fi

ASSETS=(
    "goose_${LATEST_VERSION}_amd64-vulkan.deb"
    "goose-x86_64-unknown-linux-gnu.tar.bz2"
)

echo -e "${GREEN}Checking upstream assets exist...${NC}"
MISSING=()
for asset in "${ASSETS[@]}"; do
    url=$(echo "$RELEASE_DATA" | jq -r ".assets[] | select(.name == \"${asset}\") | .browser_download_url")
    if [[ -n "$url" && "$url" != "null" ]]; then
        echo -e "  ${GREEN}✓${NC} ${asset}"
    else
        echo -e "  ${RED}✗${NC} ${asset}"
        MISSING+=("$asset")
    fi
done

if [[ ${#MISSING[@]} -gt 0 ]]; then
    echo -e "${RED}Missing assets upstream:${NC}"
    printf '  - %s\n' "${MISSING[@]}"
    exit 1
fi

echo -e "${GREEN}Updating PKGBUILD...${NC}"
sed -i \
    -e "s/^pkgver=.*/pkgver=${LATEST_VERSION}/" \
    -e "s/^pkgrel=.*/pkgrel=1/" \
    -E \
    -e "s|^(sha(256|384|512)?sums|md5sums|b2sums)=.*|b2sums=()|" \
    "$PKGBUILD_FILE"

echo -e "${GREEN}Downloading sources and computing b2sums via updpkgsums...${NC}"
updpkgsums

echo -e "${GREEN}Regenerating .SRCINFO...${NC}"
rm -f .SRCINFO
makepkg --printsrcinfo > .SRCINFO

echo ""
echo -e "${GREEN}✓ Updated: ${CURRENT_VERSION} → ${LATEST_VERSION}${NC}"

echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo "  git diff PKGBUILD .SRCINFO"
echo "  makepkg -si"
echo "  git add PKGBUILD .SRCINFO && git commit -m 'upgpkg: ${LATEST_VERSION}' && git push"