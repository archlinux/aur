#!/bin/bash

makepkg --nobuild --skipinteg

sum() {
  openssl dgst -sha256 "$1" | sed 's/^.*= //'
}

replace() {
  echo "s/^$2sha256sums=('.*')/$2sha256sums=('$(sum "$1")')/"
}

sed -i "$(replace meta);$(replace Dark-Aurora.tar.xz '  ')" PKGBUILD
