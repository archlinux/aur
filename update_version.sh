#!/bin/bash
set -e -v

VERSION=$1

sed -i "s/^pkgver=.*/pkgver="$VERSION"/" PKGBUILD
updpkgsums
mkaurball -f
namcap purescript-bin*.pkg.tar.xz
