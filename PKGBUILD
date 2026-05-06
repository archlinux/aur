#!/bin/bash
# Maintainer: czjstmax : <jstmaxlol@disroot.org>
pkgname=nosh
pkgver=1.1
pkgrel=3
pkgdesc="a minimal POSIX C- shell for -OOL people."
arch=('any')
url="https://kuronavipad.xantu-ling.ts.net/cgit/nosh.git"
license=('MIT')
makedepends=('gcc')
source=("git+https://kuronavipad.xantu-ling.ts.net/cgit/nosh.git")
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
    make all
}

package() {
	install -Dm755 "$srcdir/$pkgname/nsh" "$pkgdir/usr/bin/nsh"
}

