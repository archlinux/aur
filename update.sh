#!/bin/bash
set -e

#pkgver=$(curl -I "http://www.motivewave.com/update/download.do?file_type=LINUX" | grep -iP '^Location:' | grep -Po '[\d].+[^_amd64.deb]')
pkgver=$(curl -I "http://www.motivewave.com/update/download.do?file_type=LINUX" | grep -iP '^Location:' | grep -Po '\d+')
echo $pkgver
echo $pkgver | awk -F " " '{print $2 $3 $4}'
echo $pkgver | awk -F " " '{print $2 $3 $4}'
echo $pkgver | awk -F " " '{print $2 $3 $4}'
#pkgver=$(curl -I "http://www.motivewave.com/update/download.do?file_type=LINUX" | grep -iP '^Location:' | grep -Po '\d+\.4\.\d+(?=\.tar\.gz)')
#sed "s/^pkgver=.*/pkgver=$pkgver/" -i PKGBUILD
#updpkgsums
#makepkg --printsrcinfo > .SRCINFO
