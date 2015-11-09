#!/bin/bash

source PKGBUILD
sed -i "s/^Version=.*$/Version=${pkgver}/" pyfa.desktop
sed -i "/^md5sums=(/,/)/d" PKGBUILD 
makepkg -g >> PKGBUILD
mksrcinfo
rm *linux.zip

git add --all
git commit -m "version up: $pkgver-$pkgrel"
git push