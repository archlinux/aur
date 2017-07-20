#!/usr/bin/env bash

oldver="$(grep ^pkgver= PKGBUILD | cut -d "=" -f 2)"
oldrel="$(grep ^pkgrel= PKGBUILD | cut -d "=" -f 2)"
newrel=$(($oldrel + 1))

newver="$1"

if [ ! X${newver} == X ]; then
  echo "updating from ${oldver} to ${newver}"
else
  echo "please specify a release number.. see: https://github.com/datawire/telepresence/releases"
  exit 1
fi

set -eu

#update the buildfile
sed "s+pkgver=${oldver}+pkgver=${newver}+g" -i PKGBUILD
sed "s+pkgrel=${oldrel}+pkgrel=${newrel}+g" -i PKGBUILD

makepkg -f

#update srcinfo
makepkg --printsrcinfo > .SRCINFO

