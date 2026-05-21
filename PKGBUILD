#!/bin/bash
# Maintainer: czjstmax : <jstmaxlol@disroot.org>
pkgname=noshmore
pkgver=2.21
pkgrel=9
pkgdesc="an extended version of nosh, a minimal POSIX C shell."
arch=('any')
url="https://git.czkove.cc/noshmore"
license=('MIT')
makedepends=('readline')
source=("git+https://git.czkove.cc/noshmore")
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
    make all
}

package() {
	install -Dm755 "$srcdir/$pkgname/nshm" "$pkgdir/usr/bin/nshm"
}

