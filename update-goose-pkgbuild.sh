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
if [[ -f .SRCINFO ]]; then
    SRCINFO_VERSION=$(grep 'pkgver = ' .SRCINFO | head -n1 | cut -d'=' -f2 | tr -d ' ' || true)
else
    SRCINFO_VERSION=""
fi

echo -e "  Current (PKGBUILD): ${YELLOW}${CURRENT_VERSION}${NC}"
if [[ -n "$SRCINFO_VERSION" && "$SRCINFO_VERSION" != "$CURRENT_VERSION" ]]; then
    echo -e "  Current (.SRCINFO): ${YELLOW}${SRCINFO_VERSION}${NC} (mismatch, will update)"
fi

if [[ "$LATEST_VERSION" == "$CURRENT_VERSION" && "$LATEST_VERSION" == "$SRCINFO_VERSION" ]]; then
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
cp "$PKGBUILD_FILE" "${PKGBUILD_FILE}.bak"
[[ -f .SRCINFO ]] && cp .SRCINFO .SRCINFO.bak

sed -i \
    -e "s/^pkgver=.*/pkgver=${LATEST_VERSION}/" \
    -e "s/^pkgrel=.*/pkgrel=1/" \
    "$PKGBUILD_FILE"

echo -e "${GREEN}Downloading sources and computing b2sums via updpkgsums...${NC}"
if ! updpkgsums; then
    echo -e "${RED}updpkgsums failed or was interrupted. Reverting PKGBUILD changes...${NC}"
    mv "${PKGBUILD_FILE}.bak" "$PKGBUILD_FILE"
    exit 1
fi

echo -e "${GREEN}Regenerating .SRCINFO...${NC}"
rm -f .SRCINFO
if ! makepkg --printsrcinfo > .SRCINFO; then
    echo -e "${RED}makepkg --printsrcinfo failed. Reverting changes...${NC}"
    mv "${PKGBUILD_FILE}.bak" "$PKGBUILD_FILE"
    [[ -f .SRCINFO.bak ]] && mv .SRCINFO.bak .SRCINFO || rm -f .SRCINFO
    exit 1
fi

rm -f "${PKGBUILD_FILE}.bak" .SRCINFO.bak

echo ""
if [[ "$LATEST_VERSION" != "$CURRENT_VERSION" ]]; then
    echo -e "${YELLOW}Changes:${NC}"
    echo -e "  Version: ${CURRENT_VERSION} → ${LATEST_VERSION}"
fi
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo "  1. Review changes: git diff PKGBUILD .SRCINFO"
echo "  2. Test build: makepkg -si"
echo "  3. Commit: git add PKGBUILD .SRCINFO && git commit -m 'upgpkg: ${LATEST_VERSION}'"
echo "  4. Push: git push"