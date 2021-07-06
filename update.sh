#!/usr/bin/env bash

set -eu

if [[ $# -eq 0 ]] ; then
    echo "usage: $0 [VERSION]"
    exit 0
fi

version=$1

if [[ ${version:0:1} != "v" ]] ; then
    version="v${version}"
fi

echo "downloading f1viewer ${version} source"
wget -q "https://github.com/SoMuchForSubtlety/f1viewer/archive/refs/tags/${version}.tar.gz"
checksum=$(sha256sum "${version}".tar.gz | awk '{ print $1 }')
rm -f "${version}".tar.gz
echo "sha256 sum is ${checksum}"

echo "updating PKGBUILD"
sed -i "s/pkgver=.*/pkgver=${version:1:100}/g" PKGBUILD
sed -i "s/sha256sums=.*/sha256sums=\('${checksum}'\)/g" PKGBUILD
sed -i "s/pkgrel=.*/pkgrel=1/g" PKGBUILD

echo "generating .SRCINFO"
makepkg --printsrcinfo > .SRCINFO

echo "committing changes"
git add PKGBUILD .SRCINFO
git commit -m "update to ${version}"

echo ""
echo "run 'git push' to publish new version"