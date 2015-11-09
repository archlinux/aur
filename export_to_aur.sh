#!/bin/bash

sed -i '/^md5sums=(/,/)/d' PKGBUILD 
makepkg -g >> PKGBUILD
mksrcinfo
rm *linux.zip

source PKGBUILD
git add --all
git commit -m "version up: $pkgver-$pkgrel"
git push