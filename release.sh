#!/bin/bash
set -e
pkgver=`cat PKGBUILD | grep pkgver= | sed 's/pkgver=\(.\+\)/\1/'`
filename=kcompose-$pkgver.tar.gz
echo "Cleaning previous builds"
rm -f *.tar.xz
rm -f *.tar.zst
rm -rf pkg/

echo "Downloading version $pkgver from github"
wget https://github.com/arquivei/kcompose/archive/$pkgver.tar.gz
mv $pkgver.tar.gz $filename

echo "Calculating checksum"
checksum=`md5sum kcompose-$pkgver.tar.gz | cut -d' ' -f1`
sed -i "s/md5sums=('.\+')/md5sums=('$checksum')/g" PKGBUILD

echo "Updating .SRCINFO"
makepkg --printsrcinfo > .SRCINFO

echo "Check everything"
makepkg check

echo "Commit and push to AUR"
git add -A
git commit -m "Bumps to $pkgver"
git push
