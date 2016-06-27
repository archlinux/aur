#!/bin/bash
# Prepare tarball of gtksourceview-pkgbuild for new release

[ -r PKGBUILD ] || exit 1
pkgbase=$(grep ^pkgbase PKGBUILD | cut -d= -f2)
pkgver=$(grep ^pkgver PKGBUILD | cut -d= -f2)

[ -f $pkgbase-$pkgver.tar.gz ] && rm -v $pkgbase-$pkgver.tar.gz
tar czvf $pkgbase-$pkgver.tar.gz pkgbuild.lang pkgbuild.xml && \
md5sum $pkgbase-$pkgver.tar.gz
