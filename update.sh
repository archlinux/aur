#!/bin/bash

lastVer=$(curl "https://registry.npmjs.com/better-commits" | jq -r '."dist-tags"."latest"' )
sed -i "/pkgver/s/[0-9]\+\.[0-9]\+\.[0-9]\+/${lastVer}/" ./PKGBUILD
sum=$(makepkg -g)
sed -i "s/sha256sums=.*\$/${sum}/" ./PKGBUILD
makepkg --printsrcinfo > .SRCINFO
git commit -a
