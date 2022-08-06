#!/bin/bash -e
# Get sizes of ddnet-maps-git package file, and repository and types dirs
# This should be ran only after a successful build

source /etc/makepkg.conf
source PKGBUILD
test -d src/${pkgname%%-git}
test -d pkg/$pkgname/usr/share/ddnet/data/types/

echo "Sizes as of $pkgver"
echo
echo "Source code repository:"
echo "   $(du -sh src/${pkgname%%-git} | cut -d' ' -f1)"
echo
echo "Package:"
echo "   $(du -shD $pkgname-$pkgver-$pkgrel-$arch${PKGEXT})"
echo
echo "Server types packaged:"

cd pkg/$pkgname
for type in $(ls usr/share/ddnet/data/types/); do
    echo "   $(du -sh usr/share/ddnet/data/types/$type)"
done
