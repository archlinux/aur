#! /usr/bin/bash

version=$1

echo "confirm upgrade to v${version}?"; read

sed -i -E "s/pkgver=.*/pkgver=${version}/g" PKGBUILD
makepkg --printsrcinfo > .SRCINFO

git add .SRCINFO PKGBUILD
git commit -m "update to v${version}"