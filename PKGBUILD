#!/bin/bash
# Maintainer: czjstmax : <jstmaxlol@disroot.org>
pkgname=rf
pkgver=1.2.5
pkgrel=3
pkgdesc="a suckless and minimal, POSIX C99 alternative to Makefiles!"
arch=('any')
url="https://kuronavipad.xantu-ling.ts.net/cgit/rfile.git"
license=('MIT')
makedepends=('gcc')
source=("git+https://kuronavipad.xantu-ling.ts.net/cgit/rfile.git")
md5sums=('SKIP')

build() {
	cd "$pkgname"
	gcc rf.c -o rf -Wall -Wextra -pedantic -std=c99
}

package() {
	install -Dm755 "$pkgname/rf" "$pkgdir/usr/bin/rf"
}

