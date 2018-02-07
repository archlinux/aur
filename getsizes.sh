#!/bin/bash
# Get sizes of ddnet-maps-git package file, and repository and types dirs
# This should be ran only after a successful build

test -f PKGBUILD && source PKGBUILD || exit 1
test -d src/$_name || exit 1
test -d pkg/$pkgname/usr/share/ddnet/data/types/ || exit 1


BLK="    "
echo -e "${BLK} Sizes as of $pkgver\n "

echo -e "${BLK} Source code repository:"
echo -e "${BLK} $(du -sh src/$_name | cut -d' ' -f1)\n "

echo -e "${BLK} Package:"
echo -e "${BLK} $(du -shD $pkgname-$pkgver-$pkgrel-$arch.pkg.tar)\n "

cd pkg/$pkgname
echo -e "${BLK} Server types packaged:"
for type in $(ls usr/share/ddnet/data/types/); do
    echo -e "${BLK} $(du -sh usr/share/ddnet/data/types/$type)"
done

