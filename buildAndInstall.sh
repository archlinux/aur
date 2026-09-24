#!/bin/bash
set -e
set -o pipefail
VERSION=$1
URL=$2
VERSION_REGEX="^[0-9]+\.[0-9]+\.[0-9]+$"
if [[ ! $VERSION =~ $VERSION_REGEX ]]; then
    echo "$VERSION is not valid version in format ${VERSION_REGEX}"
    exit 1
fi
if [ -z "$URL" ]; then
    echo "Resolving AppImage URL for $VERSION"
    # Release JSON is embedded (escaped) in the page; pick the "Linux App Img" build of given version
    SHORT_URL=$(curl -Ls "https://mango3d.io/download-lychee-slicer" | \
        grep -oP "\\\\\"version\\\\\":\\\\\"${VERSION//./\\.}\\\\\".*?\\]" | head -1 | \
        grep -oP 'Linux App Img[^}]*?\\"url\\":\\"\K[^\\]+' | head -1 | tr -d ' ')
    if [ -z "$SHORT_URL" ]; then
        echo "AppImage for version $VERSION not found on download page"
        exit 1
    fi
    URL=$(curl -sIL -o /dev/null -w '%{url_effective}' "$SHORT_URL")
fi
FILENAME=$(basename "$URL")
if [[ ! $FILENAME == LycheeSlicer-$VERSION*.AppImage ]]; then
    echo "Unexpected file name $FILENAME (from $URL)"
    exit 1
fi
if [[ ! $URL == https://mango-lychee.nyc3.cdn.digitaloceanspaces.com/* ]]; then
    echo "Unexpected download host: $URL"
    exit 1
fi
echo "Downloading $URL to calculate checksum"
wget -q -O "$FILENAME" "$URL" || (echo "Version not found" && rm -f "$FILENAME" && exit 1)
SHA512=$(sha512sum "$FILENAME" | awk '{print $1}')
echo "${SHA512}"
echo "Preparing PKG file"
sed -i -e "/sha512sums_x86_64.*/{ n; s/\(\s*\)'.*'/\1'$SHA512'/ }" PKGBUILD
sed -i "s@^pkgver=.*@pkgver=$VERSION@" PKGBUILD
sed -i "s@^pkgrel=.*@pkgrel=1@" PKGBUILD
sed -i "s@^_appimage=.*@_appimage=\"${FILENAME/$VERSION/\${pkgver\}}\"@" PKGBUILD
makepkg --printsrcinfo > .SRCINFO && makepkg -f
PKG_FILE=$(ls -t1 *.tar.zst | head -n 1)
printf "Done, install $PKG_FILE? [Y/n]"
read -n1 install
if [ "${install,,}" = "y" ] || [ -z "${install}" ]; then   # ${VAR,,} is for convert to lower case
    sudo pacman -U "$PKG_FILE"
fi
