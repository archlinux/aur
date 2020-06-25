#!/bin/sh

set -e

source ./PKGBUILD

TAG_NAME=$(curl https://api.github.com/repos/flukejones/rog-core/releases/latest 2> /dev/null | jq --raw-output '.tag_name')
VERSION=$(echo $TAG_NAME | sed "s/^v\(.*\)$/\1/")

if [ "$pkgver" != "$VERSION" ]
then
    echo $pkgver "->" $VERSION
    sed -i "s/^pkgver=.*$/pkgver=$VERSION/" PKGBUILD
    sed -i "s/^pkgrel=.*$/pkgrel=1/" PKGBUILD
    sed -i "s/^sha256sums=.*/"$(makepkg --geninteg 2> /dev/null)"/" PKGBUILD
    makepkg --printsrcinfo > .SRCINFO

    git add PKGBUILD .SRCINFO
    git commit -m "Version "$VERSION
fi
