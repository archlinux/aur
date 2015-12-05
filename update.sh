#!/bin/bash
rm public_suffix_list.dat
version=$(date -u +%Y%m%d)
sed -i "s/^pkgver=.\+/pkgver=$version/" PKGBUILD
updpkgsums
makepkg -si
mksrcinfo
git add .
git commit -m "public_suffix_list: $version"
git aur push public_suffix_list
