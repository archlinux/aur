#!/bin/bash
# Maintainer: czjstmax : <jstmaxlol@disroot.org>
pkgname=nosh
pkgver=1.1
pkgrel=1
pkgdesc="a minimal POSIX C- shell for -OOL people."
arch=('any')
url="https://github.com/jstmaxlol/nosh"
license=('MIT')
makedepends=('gcc')
source=("git+https://github.com/jstmaxlol/nosh")
md5sums=('SKIP')

build() {
	cd "$srcdir/nosh"
    make all
}

package() {
	install -Dm755 "$srcdir/nsh/nsh" "$pkgdir/usr/bin/nsh"
}

md5sums=('SKIP')
