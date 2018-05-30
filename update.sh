#!/bin/sh

REPO=CupIvan/tinydns
VERSION=`wget -O - https://api.github.com/repos/$REPO/releases/latest | grep tarball_url | sed -e 's/.\+\/v\(.\+\)",/\1/g'`
wget -c https://github.com/$REPO/archive/v${VERSION}.tar.gz
MD5=`md5sum "v$VERSION.tar.gz" | awk '{ print $1 }'`
cat PKGBUILD \
	| sed -e "s/\(pkgver=\).\+/\1$VERSION/" \
	| sed -e "s/\(md5sums=('\).\+/\1$MD5')/" \
	> PKGBUILD_NEW
mv PKGBUILD_NEW PKGBUILD
makepkg --printsrcinfo > .SRCINFO
