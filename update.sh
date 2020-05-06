#!/bin/bash

ver=$(pacman -Ss linux | sed -rn 's/^core\/linux ([0-9]+(\.[0-9]+)*\.arch[0-9]+).* \[installed\]/\1/p')
sed -i "s/pkgver=.*$/pkgver=$ver/" PKGBUILD
updpkgsums
makepkg --printsrcinfo > .SRCINFO
