#!/usr/bin/env bash

if ! [ -f pkgsum.sh ]; then
  wget https://gist.github.com/nandub/04f1f049a5e55476b642/raw/02c13a02fb7e9121d1390b3a4f5f6fca5d11e07b/pkgsum.sh
  chmod +x pkgsum.sh
fi

get_latest() {
  wget -q -O- 'https://github.com/kimwalisch/primesieve/wiki/Downloads' | \
  sed -n 's,.*primesieve-\([0-9][^>]*\)\.tar.*,\1,p' | \
  grep -v '\(linux\|mac\|win\)' | \
  sort -r | \
  head -1
}
latest_version=$(get_latest)
current_version=$(cat PKGBUILD | grep pkgver= | awk -F'=' '{print $2}')

if ! [ "$latest_version" = "$current_version" ]; then
  echo Updating the package with the latest version
  echo latest: $latest_version
  echo current: $current_version
  sed -i.bak "s/$current_version/$latest_version/g" PKGBUILD
  sed -i.bak "s/pkgrel=[^d.]/pkgrel=1/g" PKGBUILD
  ./pkgsum.sh
  mksrcinfo
else
  echo Nothing to update.
fi
