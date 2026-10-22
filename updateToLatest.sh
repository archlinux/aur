#!/bin/bash
# Updates PKGBUILD to the latest MaxEllis/OrcaSlicer release and builds the package.
# Usage: ./updateToLatest.sh [-f] [tag]
#   tag  release tag to use instead of the latest one, e.g. v2.4.2-mcp.12
#   -f   rebuild even if PKGBUILD is already at that version
set -e
set -o pipefail

REPO="MaxEllis/OrcaSlicer"
API="https://api.github.com/repos/${REPO}"
TAG_REGEX='^v[0-9]+\.[0-9]+\.[0-9]+(-mcp\.[0-9]+)?$'

cd "$(dirname "$(readlink -f "$0")")"

FORCE=0
if [ "$1" = "-f" ]; then
    FORCE=1
    shift
fi

for cmd in curl jq makepkg; do
    command -v "$cmd" >/dev/null || { echo "Missing required command: $cmd"; exit 1; }
done

if [ -n "$1" ]; then
    TAG=$1
    echo "Using manually specified tag: $TAG"
    RELEASE_URL="${API}/releases/tags/${TAG}"
else
    echo "Fetching latest release of ${REPO}..."
    RELEASE_URL="${API}/releases/latest"
fi

RELEASE_JSON=$(curl -fsSL -H "Accept: application/vnd.github+json" "$RELEASE_URL") || {
    echo "Error: could not fetch release info from $RELEASE_URL"
    exit 1
}
TAG=$(jq -r '.tag_name' <<<"$RELEASE_JSON")

if [[ ! $TAG =~ $TAG_REGEX ]]; then
    echo "Unexpected tag format: '$TAG' (expected ${TAG_REGEX})"
    exit 1
fi

VERSION=${TAG#v}           # 2.4.2-mcp.13
PKGVER=${VERSION//-/_}     # 2.4.2_mcp.13 (pacman doesn't allow '-' in pkgver)
APPIMAGE="OrcaSlicer-MCP-${VERSION}-linux-x64.AppImage"

if ! jq -e --arg n "$APPIMAGE" '.assets[] | select(.name == $n)' <<<"$RELEASE_JSON" >/dev/null; then
    echo "Release $TAG has no asset named $APPIMAGE"
    exit 1
fi

CURRENT_PKGVER=$(grep "^pkgver=" PKGBUILD | cut -d'=' -f2)
if [ "$CURRENT_PKGVER" = "$PKGVER" ] && [ "$FORCE" = 0 ]; then
    echo "Already up to date (pkgver $CURRENT_PKGVER). Use -f to rebuild anyway."
    exit 0
fi
echo "Updating pkgver $CURRENT_PKGVER -> $PKGVER ($TAG)"

# Checksum published by upstream; makepkg verifies the download against it
SUMS_URL=$(jq -r '.assets[] | select(.name == "SHA256SUMS.txt") | .browser_download_url' <<<"$RELEASE_JSON")
if [ -n "$SUMS_URL" ]; then
    SHA256=$(curl -fsSL "$SUMS_URL" | awk -v f="$APPIMAGE" '$2 == f || $2 == "*"f {print $1}')
fi
if [[ ! $SHA256 =~ ^[0-9a-f]{64}$ ]]; then
    echo "No checksum for $APPIMAGE in SHA256SUMS.txt, downloading to compute it..."
    curl -fL -o "$APPIMAGE" "https://github.com/${REPO}/releases/download/${TAG}/${APPIMAGE}"
    SHA256=$(sha256sum "$APPIMAGE" | awk '{print $1}')
fi
echo "sha256: $SHA256"

echo "Preparing PKGBUILD"
sed -i "s@^pkgver=.*@pkgver=$PKGVER@" PKGBUILD
if [ "$CURRENT_PKGVER" != "$PKGVER" ]; then
    sed -i "s@^pkgrel=.*@pkgrel=1@" PKGBUILD
fi
sed -i "s@^sha256sums_x86_64=.*@sha256sums_x86_64=('$SHA256')@" PKGBUILD

makepkg --printsrcinfo > .SRCINFO
makepkg -f

PKG_FILE=$(ls -t1 ./*.pkg.tar.zst | head -n 1)
printf "Done, install %s? [Y/n] " "$PKG_FILE"
read -r -n1 install
echo
if [ "${install,,}" = "y" ] || [ -z "${install}" ]; then
    sudo pacman -U "$PKG_FILE"
fi
