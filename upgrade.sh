#!/bin/bash
set -e

if [ "$#" -lt 1 ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    echo "Usage: $0 [-h|--help] version" >&2
    exit 1
fi

. ./PKGBUILD
sed -i "s/$pkgver/$1/" PKGBUILD
. ./PKGBUILD

tmp="$(mktemp)"
cleanup() { rm -f "$tmp"; }
trap cleanup EXIT

curl -fsL "${source[0]}" -o "$tmp"
sum="$(sha256sum "$tmp" | cut -c -64)"

cleanup
unset cleanup
trap - EXIT

sed -i -e "s/${sha256sums[0]}/$sum/g" PKGBUILD
makepkg --printsrcinfo > .SRCINFO

git add .
git commit -m "Upgrade to $1"
