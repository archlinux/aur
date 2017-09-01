#!/bin/bash
# Get sizes of ddnet-maps-git package file, and repository and types dirs
# This should be ran only after a successful build

test -f PKGBUILD || exit 1
test -d src || exit 1

source PKGBUILD

echo "Sizes as of $pkgver :"
echo ""
du -shD $pkgname-$pkgver-$pkgrel-$arch.pkg.tar.xz
du -sh src/$_name | cut -d' ' -f1
echo ""
cd pkg/$pkgname
for type in $(ls usr/share/ddnet/data/types/); do
    du -sh usr/share/ddnet/data/types/$type
done

