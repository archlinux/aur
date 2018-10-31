#!/usr/bin/env bash

verold="$(grep ^pkgver= PKGBUILD | cut -d "=" -f 2)"
oldrel="$(grep ^pkgrel= PKGBUILD | cut -d "=" -f 2)"
md5old="$(grep md5sums_x86_64 PKGBUILD | cut -d '"' -f 2)"
newrel=$(($oldrel + 1))

pkgver="$(cat new_ver.txt | awk '{print $2}'| sed "s+v++")"

if [ X${verold} == X${pkgver} ]; then
  echo "NO UPDATE DETECTED (old: ${verold}, new: ${pkgver} - $1)"
  exit 0
fi

# determine new md5sum
tempdir="$(mktemp -d)"
tempfile="${tempdir}/filename"
curl -sL https://github.com/wagoodman/dive/releases/download/v${pkgver}/dive_${pkgver}_linux_amd64.tar.gz -o "${tempfile}"
md5new="$(md5sum "${tempfile}" | awk '{print $1}')"
# rm -rf "${tempdir}"

echo md5old=${md5old}, md5new=${md5new}

#update the buildfile
sed "s+pkgver=${verold}+pkgver=${pkgver}+g" -i PKGBUILD
sed "s+pkgrel=${oldrel}+pkgrel=${newrel}+g" -i PKGBUILD
sed "s+${md5old}+${md5new}+g" -i PKGBUILD

set -eu

makepkg -f

#update srcinfo
makepkg --printsrcinfo > .SRCINFO

