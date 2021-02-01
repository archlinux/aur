#!/bin/sh

set -e

version=$1
tmp_tar=$(mktemp)
trap "rm ${tmp_tar}" EXIT
wget https://github.com/denisidoro/navi/archive/v${version}.tar.gz -O $tmp_tar
checksum=$(sha256sum $tmp_tar | awk '{print $1}')
sed -i "s/^pkgver='.*'/pkgver='${version}'/g" PKGBUILD
sed -i "s/^sha256sums=('.*')/sha256sums=('${checksum}')/g" PKGBUILD
makepkg -si
makepkg --printsrcinfo > .SRCINFO
git add PKGBUILD .SRCINFO
git diff --cached
git commit -S -m "Update to ${version}"
echo -n "Press Enter to push..."
read check
git push
paru -Si navi
