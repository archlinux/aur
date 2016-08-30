#!/bin/bash

source PKGBUILD
sed -i "s/^Version=.*$/Version=${pkgver}/" shortcircuit.desktop
sed -i "/^sha256sums=(/,/)/d" PKGBUILD 
makepkg -g >> PKGBUILD
mksrcinfo
rm -f *.tar.gz

git add --all
git commit -m "Bump to: $pkgver-$pkgrel"
git push
