#!/usr/bin/env bash

LINUX_DEB_END_PATTERN="amd64.deb"

if [[ -n "$1" ]]; then
    RELEASE_DATA=$(curl -s https://api.github.com/repos/Kesomannen/gale/releases/tags/$1)
else
    RELEASE_DATA=$(curl -s https://api.github.com/repos/Kesomannen/gale/releases/latest)
fi

VERSION=$(echo "$RELEASE_DATA" | jq '.name' | sed 's/\"//g')
DOWNLOAD_URL=$(echo "$RELEASE_DATA" | jq -r '.assets[] | select(.browser_download_url | endswith("'$LINUX_DEB_END_PATTERN'")) | .browser_download_url')
CHECKSUM=$(echo "$RELEASE_DATA" | jq -r '.assets[] | select(.browser_download_url | endswith("'$LINUX_DEB_END_PATTERN'")) | .digest | sub("^sha256:"; "")')

wget "$DOWNLOAD_URL"

DEB_FILE="Gale_${VERSION}_${LINUX_DEB_END_PATTERN}"

sed -ri "s/pkgver=[0-9.]+/pkgver=$VERSION/" PKGBUILD
sed -ri "s/(sha256sums_x86_64=\(\s*?)'[0-9A-Za-z]+'/\1'$CHECKSUM'/g" PKGBUILD

rm "$DEB_FILE"