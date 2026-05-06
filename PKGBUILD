#!/bin/bash
# Maintainer: czjstmax : <jstmaxlol@disroot.org>
pkgname=noshmore
pkgver=2.21
pkgrel=8
pkgdesc="an extended version of nosh, a minimal POSIX C shell."
arch=('any')
#url="https://github.com/jstmaxlol/noshmore"
url="https://kuronavipad.xantu-ling.ts.net/cgit/noshmore.git"
license=('MIT')
makedepends=('readline')
source=("git+https://kuronavipad.xantu-ling.ts.net/cgit/noshmore.git")
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
    make all
}

package() {
	install -Dm755 "$srcdir/$pkgname/nshm" "$pkgdir/usr/bin/nshm"
}

