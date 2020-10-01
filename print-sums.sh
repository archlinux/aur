#!/bin/bash

set -e

pkgver="$1"
if [ -z "$pkgver" ]; then
  echo "No pkgver set"
  exit 1;
fi

file=`mktemp`

function download_and_print_sum() {
  echo "Downloading for $arch ..."
  curl -sL "https://github.com/imolorhe/altair/releases/download/v$pkgver/altair_${pkgver}_${arch}_linux.AppImage" --output "$file"
  sum=`sha256sum $file`
  echo "==> $sum"
}

arch="x86_64"
download_and_print_sum
