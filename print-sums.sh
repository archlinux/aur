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
  curl -sL "https://github.com/rancher/k3d/releases/download/v$pkgver/k3d-linux-${arch}" --output "$file"
  sum=`sha256sum $file`
  echo "==> $sum"
}

arch="amd64"
download_and_print_sum
arch="arm64"
download_and_print_sum
arch="arm"
download_and_print_sum
