#!/bin/bash

sed -i '/^md5sums=(/,/)/d' PKGBUILD 
makepkg -g >> PKGBUILD
mksrcinfo
rm *linux.zip

git add --all
git commit -m "version up"
git push