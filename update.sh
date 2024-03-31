#!/bin/sh

# Automatically fetches the latest information from pypi and update the package

set -e

PAGE=$(curl -L https://pypi.org/project/types-Pillow)

blake_hash=$(echo "$PAGE" | grep -A 1 -m1 "BLAKE2b-256" | tail -n1 | sed -E 's/.*>(.*)<\/code>.*/\1/')
version=$(echo "$PAGE" | grep -A1 -m1 '<h1 class="package-header__name">' | tail -n1 | rev | cut -d' ' -f1 | rev)

echo "hash: $blake_hash, version: $version"

set -x

sed -Ei 's/pkgver="(.*)"/pkgver="'$version'"/' PKGBUILD
sed -Ei 's/_source_hash="(.*)"/_source_hash="'$blake_hash'"/' PKGBUILD

updpkgsums

makepkg --printsrcinfo > .SRCINFO

git add .SRCINFO PKGBUILD
git commit -m "Updated to $version"
