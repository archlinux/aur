#!/usr/bin/env bash

get_latest() {
  wget -q -O- 'https://github.com/kimwalisch/primesieve/wiki/Downloads' | \
  sed -n 's,.*primesieve-\([0-9][^>]*\)\.tar.*,\1,p' | \
  grep -v '\(linux\|mac\|win\)' | \
  sort -r | \
  head -1
}

latest_version=$1
#latest_version=$(get_latest)
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
else
  echo Nothing to update.
fi
