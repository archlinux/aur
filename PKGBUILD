#!/bin/bash
# Maintainer: czjstmax : <jstmaxlol@disroot.org>
pkgname=rf
pkgver=1.2.5
pkgrel=4
pkgdesc="a suckless and minimal, POSIX C99 alternative to Makefiles!"
arch=('any')
url="https://kuronavipad.xantu-ling.ts.net/cgit/rfile.git"
license=('MIT')
makedepends=('gcc')
source=("git+https://kuronavipad.xantu-ling.ts.net/cgit/rfile.git")
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	gcc rf.c -o rf -Wall -Wextra -pedantic -std=c99
}

package() {
	install -Dm755 "$srcdir/$pkgname/rf" "$srcdir/$pkgdir/usr/bin/rf"
}

