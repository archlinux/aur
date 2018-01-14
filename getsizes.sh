#!/bin/bash
# Get sizes of ddnet-maps-git package file, and repository and types dirs
# This should be ran only after a successful build

test -f PKGBUILD && source PKGBUILD || exit 1
test -d src/$_name || exit 1
test -d pkg/$pkgname/usr/share/ddnet/data/types/ || exit 1

echo -e "Sizes as of $pkgver :\n"

du -shD $pkgname-$pkgver-$pkgrel-$arch.pkg.tar.xz
du -sh src/$_name | cut -d' ' -f1
echo ""

cd pkg/$pkgname
for type in $(ls usr/share/ddnet/data/types/); do
    du -sh usr/share/ddnet/data/types/$type
done

