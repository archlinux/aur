#!/bin/bash

SRC="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

CRATE=pam-ssh-agent

crate_release() {
  curl \
    -s \
    -H 'User-Agent: test (auser@gmail.com)' \
    "https://crates.io/api/v1/crates/$1" | jq -r .crate.max_version
}

VER=$(crate_release $CRATE)

sed -i "s/pkgver=.*$/pkgver=${VER#v}/" $SRC/PKGBUILD
sed -i "s/sha256sums\\([^=]*\\)=.*$/sha256sums\\1=('SKIP')/" $SRC/PKGBUILD
sed -i "s/pkgrel=.*$/pkgrel=1/" $SRC/PKGBUILD

pushd $SRC &> /dev/null
updpkgsums
makepkg --printsrcinfo > .SRCINFO
popd &> /dev/null
