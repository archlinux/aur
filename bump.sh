#! /usr/bin/env bash

set -e

printf "New version: "
read NEWVER
sed -i -e "s/pkgver=.*/pkgver=${NEWVER}/g" PKGBUILD

sed '/sha512sums/d' PKGBUILD
makepkg -g >> PKGBUILD
