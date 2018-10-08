#!/usr/bin/env bash


oldver="$(grep ^pkgver= PKGBUILD | cut -d "=" -f 2)"
oldrel="$(grep ^pkgrel= PKGBUILD | cut -d "=" -f 2)"
md5old="$(grep md5sums PKGBUILD | cut -d "'" -f 2)"
newrel=$(($oldrel + 1))

pkgver="$(cat new_ver.txt | awk '{print $2}')"

if [ ! X${pkgver} == X ]; then
  echo "updating from ${oldver} to ${pkgver}"
else
  echo "please specify a release number.. see: https://github.com/datawire/telepresence/releases"
  exit 1
fi
set -x

# determine new md5sum
tempdir="$(mktemp -d)"
tempfile="${tempdir}/filename"
curl -sL https://github.com/telepresenceio/telepresence/archive/${pkgver}.tar.gz -o "${tempfile}"
md5new="$(md5sum "${tempfile}" | awk '{print $1}')"
# rm -rf "${tempdir}"

echo md5old=${md5old}, md5new=${md5new}

#update the buildfile
sed "s+pkgver=${oldver}+pkgver=${pkgver}+g" -i PKGBUILD
sed "s+pkgrel=${oldrel}+pkgrel=${newrel}+g" -i PKGBUILD
sed "s+${md5old}+${md5new}+g" -i PKGBUILD

set -eu

makepkg -f

#update srcinfo
makepkg --printsrcinfo > .SRCINFO

