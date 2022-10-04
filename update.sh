#!/bin/bash
set -e

pkgver=$(curl --http1.1 -I "https://www.dropbox.com/download?plat=lnx.x86_64" | grep -iP '^Location:' | grep -Po '\d+\.4\.\d+(?=\.tar\.gz)')
sed "s/^pkgver=.*/pkgver=$pkgver/" -i PKGBUILD
updpkgsums
makepkg --printsrcinfo > .SRCINFO
