#!/usr/bin/env bash
set -ex

ver=$1

sed -i "s/pkgver=.*$/pkgver=$ver/" PKGBUILD
sed -i "/sha256sums.*$/d" PKGBUILD
makepkg -g >> PKGBUILD
makepkg --printsrcinfo > .SRCINFO
makepkg
git add .SRCINFO PKGBUILD
git commit -m "bump to $ver"
git push
