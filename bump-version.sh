#!/usr/bin/env sh

set -e

version=$1
script_dir=$(dirname -- "$(readlink -f "$0")")

cwd=$(pwd)
cd "$script_dir"

sed -i -E 's/^pkgver=.+$/pkgver='"$version"'/' PKGBUILD
updpkgsums
makepkg --printsrcinfo > .SRCINFO
git add PKGBUILD .SRCINFO
git commit -m "Bump to v$version"
git push

cd "$cwd"
