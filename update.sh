#!/bin/bash

ver=$(pacman -Qs linux | grep "local/linux "  | sed -rn 's/^local\/linux ([0-9]+(\.[0-9]+)*\.arch[0-9]+).*/\1/p')
sed -i "s/pkgver=.*$/pkgver=$ver/" PKGBUILD
updpkgsums
makepkg --printsrcinfo > .SRCINFO
