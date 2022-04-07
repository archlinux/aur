#!/bin/bash
set -e 
set -o pipefail
VERSION=$1
VERSION_REGEX="^[0-9]+\.[0-9]+\.[0-9]+$"
if [[ ! $VERSION =~ $VERSION_REGEX ]]; then
    echo "$VERSION is not valid version in format ${VERSION_REGEX}"
fi
SHA512=$(wget -q -O - "https://mango-lychee.nyc3.cdn.digitaloceanspaces.com/LycheeSlicer-$VERSION.deb" | sha512sum | awk '{print $1}') \
    || (echo "Version not found" && exit 1)
sed -i "s@sha512sums_x86_64=(.*)@sha512sums_x86_64=('$SHA512')@g" PKGBUILD
sed -i "s@pkgver=.*@pkgver=$VERSION@g" PKGBUILD
makepkg --printsrcinfo > .SRCINFO && makepkg
PKG_FILE=$(ls -t1 *.tar.zst | head -n 1)
printf "Installing $PKG_FILE? [Y/n]"
read install
if [ "$install" = "y" ]; then
    sudo pacman -U *.tar.zst
fi
