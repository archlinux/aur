#!/usr/bin/env bash

latest_version=$1
current_version=$(cat PKGBUILD | grep pkgver= | awk -F'=' '{print $2}')

if ! [ "$latest_version" = "$current_version" ]; then
  echo Updating the package with the latest version
  echo latest: $latest_version
  echo current: $current_version
  sed -i.bak "s/$current_version/$latest_version/g" PKGBUILD
  sed -i.bak "s/pkgrel=[^d.]/pkgrel=1/g" PKGBUILD
  ./pkgsum.sh
  if which makepkg &> /dev/null; then
    makepkg --printsrcinfo > .SRCINFO
  else
    mksrcinfo
  fi
  rm -f *.bak
else
  echo Nothing to update.
fi
