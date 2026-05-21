#!/bin/bash
# Maintainer: czjstmax : <jstmaxlol@disroot.org>
pkgname=rf
pkgver=latest
pkgrel=7
pkgdesc="a suckless and minimal, POSIX C99 alternative to Makefiles!"
arch=('any')
url="https://git.czkove.cc/rfile"
license=('MIT')
makedepends=('gcc')
source=("git+https://git.czkove.cc/rfile")
md5sums=('SKIP')

build() {
	cd "$srcdir/rfile"
	gcc rf.c -o rf -Wall -Wextra -pedantic -std=c99
}

package() {
	install -Dm755 "$srcdir/rfile/rf" "$srcdir/rfile/usr/bin/rf"
}

