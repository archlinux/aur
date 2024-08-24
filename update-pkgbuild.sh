#!/usr/bin/env bash

if [[ -n "$1" ]]; then
    RELEASE_DATA=$(curl -s https://api.github.com/repos/Kesomannen/gale/releases/tags/$1)
else
    RELEASE_DATA=$(curl -s https://api.github.com/repos/Kesomannen/gale/releases/latest)
fi

VERSION=$(echo "$RELEASE_DATA" | jq '.name' | sed 's/\"//g')
DOWNLOAD_URL=$(echo "$RELEASE_DATA" | jq '.assets.[].browser_download_url' | grep -h '.deb' | sed 's/\"//g')

wget "$DOWNLOAD_URL"

if [ -f "gale_${VERSION}_amd64.deb" ]; then
    DEB_FILE="gale_${VERSION}_amd64.deb"
elif [ -f "Gale_${VERSION}_amd64.deb" ]; then
    DEB_FILE="Gale_${VERSION}_amd64.deb"
fi

CHECKSUM=$(sha256sum "$DEB_FILE" | sed "s/$DEB_FILE//g" | sed 's/^ *//g' | sed 's/ *$//g')

sed -ri "s/pkgver=[0-9.]+/pkgver=$VERSION/" PKGBUILD
sed -ri "s/(sha256sums_x86_64=\(\s*?)'[0-9A-Za-z]+'/\1'$CHECKSUM'/g" PKGBUILD

rm "$DEB_FILE"