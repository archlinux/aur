#!/bin/bash

arch=( 'x86_64' 'i686' 'arm' 'aarch64' )
_arch=( 'amd64' '386' 'arm' 'arm64' )

sed -i "s/pkgver=.*/pkgver=${PKGVER}/" PKGBUILD

for a in "${!arch[@]}"; do
  wget -q https://cache.agilebits.com/dist/1P/op2/pkg/v"${PKGVER}"/op_linux_"${_arch[a]}"_v"${PKGVER}".zip
  unzip -q op_linux_"${_arch[a]}"_v"${PKGVER}".zip
  if gpgv -q op.sig op > /dev/null 2>&1; then
    sha256=$(sha256sum op_linux_"${_arch[a]}"_v"${PKGVER}".zip | awk '{print $1}')
    sed -i "s/sha256sums_${arch[a]}=.*/sha256sums_${arch[a]}=\('${sha256}'\)/" PKGBUILD
  else
    echo "Bad Signature for op_linux_${arch[a]}_v${PKGVER}.zip."
  fi
  rm op*
done
