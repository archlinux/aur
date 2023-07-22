#!/bin/sh
if [ $# -lt 1 -o $# -gt 2 ]
then
    echo >&2 "usage: $0 <PKGVER> [PKGREL]"
    exit 1
fi

set -e
PKGVER="$1"
PKGREL="${2:-1}"

sed -i "s/^pkgver=.*/pkgver='$PKGVER'/" PKGBUILD
sed -i "s/^pkgrel=.*/pkgrel=$PKGREL/" PKGBUILD
makepkg --printsrcinfo > .SRCINFO

echo >&2 "updated PKGBUILD and .SRCINFO successfully"
echo >&2 "running 'makepkg -f' to test build..."

makepkg -f
