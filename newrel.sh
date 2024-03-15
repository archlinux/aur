#!/bin/bash

set -e

# Get rast release version for PKGBUILD file
VERSION=$(curl --silent https://api.github.com/repos/schmidtandreas/wofi-pass/releases/latest | grep "tag_name" | cut -d ":" -f 2 | sed "s|.*\"\(.*\)\".*|\1|")
test -n "${VERSION}"

# Update PKGBUILD file
wget "https://github.com/schmidtandreas/wofi-pass/releases/download/${VERSION}/wofi-pass" -O "app"
wget "https://github.com/schmidtandreas/wofi-pass/releases/download/${VERSION}/wofi-pass.1.gz" -O "manpage"
CHECKSUM_app=$(sha512sum app | awk '{ print $1 }')
CHECKSUM_manpage=$(sha512sum manpage | awk '{ print $1 }')
sed -i "s|sha512sums.*|sha512sums=('${CHECKSUM_app}\n             ${CHECKSUM_manpage}')|" PKGBUILD
rm app manpage

# Increase pkgrel if version is not changed
CURRENT_VERSION="$(grep pkgver .SRCINFO | cut -d "=" -f 2 | sed "s|^[[:space:]]*||")"
if [[ "${VERSION}" == "${CURRENT_VERSION}" ]]; then
    CURRENT_PKGREL=$(grep pkgrel .SRCINFO | cut -d "=" -f 2 | sed "s|^[[:space:]]*||")
    sed -i "s|pkgrel.*|pkgrel=$((CURRENT_PKGREL + 1))|" PKGBUILD
fi

# Update source info
makepkg --printsrcinfo > .SRCINFO

# Monky Test
makepkg -sri

# Cleanup
[ -d pkg ] && rm -fr pkg
[ -d src ] && rm -fr src
[ -f wofi-pass ] && rm wofi-pass
[ -f wofi-pass.conf ] && rm wofi-pass.conf
[ -f wofi-pass.1.gz ] && rm wofi-pass.1.gz
[ -f LICENSE ] && rm LICENSE
