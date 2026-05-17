#!/bin/sh

set -xeu

pkgver="$1"

HASH="$(curl -sSf "http://gondor.apana.org.au/~herbert/dash/files/dash-${pkgver}.tar.gz.sha512sum" | grep "dash-${pkgver}.tar.gz" | cut '-d ' -f1)"

sed -ri "s/^pkgver=.+\$/pkgver=${pkgver}/" PKGBUILD
sed -ri "s/^sha512sums=\('[a-f0-9]+'\)\$/sha512sums=('${HASH}')/" PKGBUILD

makepkg --printsrcinfo > .SRCINFO
