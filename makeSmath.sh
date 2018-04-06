#!/bin/bash

_pkgcode=XTRcr
pkgver=0_99_6670

wget --post-data "RefMem=&PostBack=${_pkgcode}" https://smath.info/file/${_pkgcode}/SMathStudioDesktop.${pkgver}.mono.tar.gz


_pkgmd5sum=$(md5sum SMathStudioDesktop.${pkgver}.mono.tar.gz |awk '{ print $1 }')
# echo ${_pkgmd5sum}

sed -i "11s/.*/pkgver=${pkgver}/" PKGBUILD
sed -i "14s/.*/_pkgcode=${_pkgcode}/" PKGBUILD
sed -i "23s/.*/md5sums=\(\'${_pkgmd5sum}\'\)/" PKGBUILD
rm SMathStudioDesktop.${pkgver}.mono.tar.gz

#makepkg --printsrcinfo > .SRCINFO
#First do the git commit by hand
# git add PKGBUILD .SRCINFO
# git commit -m "Update to ${pkgver}"
# git push


echo "Finished updating the SMATH package to ${pkgver}"
