#!/bin/bash
cd "$(dirname "$0")"

[[ "$#" -ne 0 ]] || exit 1

sed -E -i "s/pkgver=.*/pkgver=${1}/" PKGBUILD
updpkgsums
makepkg --printsrcinfo >.SRCINFO
