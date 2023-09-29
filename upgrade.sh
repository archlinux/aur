#!/bin/bash


cat PKGBUILD | sed -n '/#/,/sha256sums/p' | head -n -1 > PKGNEW
mv PKGNEW PKGBUILD

makepkg --skipchecksums -o

makepkg -g >> PKGBUILD
makepkg --printsrcinfo > .SRCINFO

makepkg -si


