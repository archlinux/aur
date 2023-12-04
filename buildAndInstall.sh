#!/bin/bash
set -e 
set -o pipefail
VERSION=$1
VERSION_REGEX="^[0-9]+\.[0-9]+\.[0-9]+$"
if [[ ! $VERSION =~ $VERSION_REGEX ]]; then
    echo "$VERSION is not valid version in format ${VERSION_REGEX}"
fi
echo "Downloading package to calculate checksum"
SHA512=$(wget -q -O - "https://mango-lychee.nyc3.cdn.digitaloceanspaces.com/LycheeSlicer-$VERSION.deb" | sha512sum | awk '{print $1}') \
    || (echo "Version not found" && exit 1)
echo "Preparing PKG file"
sed -i -e "/sha512sums_x86_64.*/{ n; s/\(\s*\)'.*'/\1'$SHA512'/ }" PKGBUILD
sed -i "s@pkgver=.*@pkgver=$VERSION@g" PKGBUILD
makepkg --printsrcinfo > .SRCINFO && makepkg -f
PKG_FILE=$(ls -t1 *.tar.zst | head -n 1)
printf "Done, install $PKG_FILE? [Y/n]"
read -n1 install
if [ "${install,,}" = "y" ]; then   # ${VAR,,} is for convert to lower case
    sudo pacman -U "$PKG_FILE"
fi
