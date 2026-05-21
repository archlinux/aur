#!/bin/bash
# Maintainer: czjstmax : <jstmaxlol@disroot.org>
pkgname=nosh
pkgver=1.1
pkgrel=4
pkgdesc="a minimal POSIX C- shell for -OOL people."
arch=('any')
url="https://git.czkove.cc/nosh"
license=('MIT')
makedepends=('gcc')
source=("git+https://git.czkove.cc/nosh")
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
    make all
}

package() {
	install -Dm755 "$srcdir/$pkgname/nsh" "$pkgdir/usr/bin/nsh"
}

