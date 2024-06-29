#!/usr/bin/env bash

LATEST_DATA=$(curl -s https://api.github.com/repos/Kesomannen/gale/releases/latest)

VERSION=$(echo "$LATEST_DATA" | jq '.name' | sed 's/\"//g')
DOWNLOAD_URL=$(echo "$LATEST_DATA" | jq '.assets.[].browser_download_url' | grep -h '.deb' | sed 's/\"//g')

wget "$DOWNLOAD_URL"

DEB_FILE="gale_${VERSION}_amd64.deb"
CHECKSUM=$(sha256sum "$DEB_FILE" | sed "s/$DEB_FILE//g" | sed 's/^ *//g' | sed 's/ *$//g')

sed -ri "s/pkgver=[0-9.]+/pkgver=$VERSION/" PKGBUILD
sed -ri "s/sha256sums_x86_64=\('[0-9A-Za-z]+'\)/sha256sums_x86_64=\('$CHECKSUM'\)/g" PKGBUILD

rm "$DEB_FILE"

# sed -ri "s/pkgver=[0-9.]+/pkgver=$VERSION/" PKGBUILD