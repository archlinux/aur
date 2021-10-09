#!/usr/bin/env bash

set -euo pipefail

source PKGBUILD

mkdir -p tmp

curl "${source_i686}" -o tmp/astrill-setup-linux.rpm
curl "${source_x86_64}" -o tmp/astrill-setup-linux64.rpm

sha256sums_i686="$(sha256sum tmp/astrill-setup-linux.rpm | awk '{ print $1 }')"
sha256sums_x86_64="$(sha256sum tmp/astrill-setup-linux64.rpm | awk '{ print $1 }')"

sed "s/^sha256sums_i686=.*/sha256sums_i686=('${sha256sums_i686}')/" -i PKGBUILD
sed "s/^sha256sums_x86_64=.*/sha256sums_x86_64=('${sha256sums_x86_64}')/" -i PKGBUILD

version_raw="$(dd if=tmp/astrill-setup-linux.rpm ibs=1 skip=18 count=12)"
version="${version_raw//-/.}"
sed "s/^pkgver=.*/pkgver=${version}/" -i PKGBUILD

makepkg --printsrcinfo > .SRCINFO

rm -r tmp

makepkg -f

echo "
Successfully updated:
  Version ${version}
  ${source_i686} ${sha256sums_i686}
  ${source_x86_64} ${sha256sums_x86_64}
"


