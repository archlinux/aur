#!/bin/sh
set -e
set -o pipefail

version=$1
checksum=$(curl -L https://github.com/rsteube/carapace-bin/releases/download/v${version}/checksums.txt | grep Linux_x86_64 | awk '{print $1}')
sed -e "s/^pkgver=.*/pkgver=${version}/" \
    -e "s/^sha256sums=.*/sha256sums=('${checksum}')/" \
    -i PKGBUILD

makepkg --printsrcinfo > .SRCINFO
