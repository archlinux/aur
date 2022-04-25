#!/usr/bin/env bash

set -e

rm -rf ferdium-*.pkg.tar.zst
makepkg
makepkg --printsrcinfo > .SRCINFO
newversion=$(grep pkgver .SRCINFO | awk -F= '{print $2}' | sed -e 's/ //g')
git commit -am "Updated to ${newversion}."
