#!/bin/bash

SRC="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

REPO=siderolabs/omni

github_release() {
  curl -s "https://api.github.com/repos/$1/releases/latest"|jq -r .tag_name
}

VER=$(github_release $REPO)

sed -i "s/pkgver=.*$/pkgver=${VER#v}/" $SRC/PKGBUILD
sed -i "s/sha256sums\\([^=]*\\)=.*$/sha256sums\\1=('SKIP')/" $SRC/PKGBUILD
sed -i "s/pkgrel=.*$/pkgrel=1/" $SRC/PKGBUILD
pushd $SRC &> /dev/null
updpkgsums
makepkg --printsrcinfo > .SRCINFO
popd &> /dev/null
