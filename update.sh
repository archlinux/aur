#!/bin/sh
if [ $# -lt 1 -o $# -gt 2 ]
then
    echo >&2 "usage: $0 <PKGVER> [PKGREL]"
    exit 1
fi

set -e
PKGVER="$1"
PKGREL="${2:-1}"

echo >&2 "updating PKGBUILD versions..."
sed -i "s/^pkgver=.*/pkgver='$PKGVER'/" PKGBUILD
sed -i "s/^pkgrel=.*/pkgrel=$PKGREL/" PKGBUILD

echo >&2 "running 'updpkgsums' to update checksums..."
updpkgsums

echo >&2 "running 'updpkgsums' to update .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO

echo >&2 "running 'makepkg -f' to test build..."
makepkg -f
