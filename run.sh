#!/usr/bin/env bash

VERSION=5.0.18

sed -r "s/pkgver=.*/pkgver=$VERSION/" -i PKGBUILD
# download package and let it fail
makepkg --install 2>/dev/null

HASH=`sha256sum jcloisterzone-$VERSION.deb | awk -F ' ' '{print $1}'`
sed -r "s/sha256sums=.*/sha256sums=('$HASH')/" -i PKGBUILD
makepkg --printsrcinfo > .SRCINFO
git add .SRCINFO PKGBUILD
