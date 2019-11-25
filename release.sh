#!/bin/bash
set -e
pkgver=`cat PKGBUILD | grep pkgver= | sed 's/pkgver=\(.\+\)/\1/'`
filename=kcompose-$pkgver.tar.gz
wget https://github.com/arquivei/kcompose/archive/$pkgver.tar.gz
mv $pkgver.tar.gz $filename
checksum=`md5sum kcompose-$pkgver.tar.gz | cut -d' ' -f1`
sed -i "s/md5sums=('.\+')/md5sums=('$checksum')/g" PKGBUILD
makepkg --printsrcinfo > .SRCINFO
makepkg check
git add -A
git commit -m "Bumps to $pkgver"
git push
