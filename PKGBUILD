#!/bin/bash
# Maintainer: czjstmax : <jstmaxlol@disroot.org>
pkgname=noshmore
pkgver=1
pkgrel=2
pkgdesc="an extended version of nosh, a minimal POSIX C shell."
arch=('any')
url="https://github.com/jstmaxlol/noshmore"
license=('MIT')
makedepends=('readline')
source=("git+https://github.com/jstmaxlol/noshmore")
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
    make all
}

package() {
	install -Dm755 "$srcdir/$pkgname/nshm" "$pkgdir/usr/bin/nshm"
}

