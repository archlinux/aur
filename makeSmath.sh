#!/bin/bash

_pkgcode=YGSRa
pkgver=1_00_8238
pkgrel=1

wget --post-data "RefMem=&PostBack=${_pkgcode}" https://smath.com/file/${_pkgcode}/SMathStudioDesktop.${pkgver}.Mono.tar.gz


_pkgmd5sum=$(md5sum SMathStudioDesktop.${pkgver}.Mono.tar.gz |awk '{ print $1 }')
# echo ${_pkgmd5sum}

sed -i "11s/.*/pkgver=${pkgver}/" PKGBUILD
sed -i "12s/.*/pkgrel=${pkgrel}/" PKGBUILD
sed -i "14s/.*/_pkgcode=${_pkgcode}/" PKGBUILD
sed -i "23s/.*/md5sums=\(\'${_pkgmd5sum}\'\)/" PKGBUILD
rm SMathStudioDesktop.${pkgver}.Mono.tar.gz

makepkg --printsrcinfo > .SRCINFO

git add PKGBUILD .SRCINFO makeSmath.sh
git commit -m "Update to ${pkgver} rel=${pkgrel}"
# git push


echo "Finished updating the SMATH package to ${pkgver}-rel=${pkgrel}"
