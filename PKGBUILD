#!/bin/bash
# Maintainer: jstmax! <jstmaxlol@disroot.org> & <maxwasmailed@proton.me>
pkgname=gim
pkgver=1
pkgrel=1
pkgdesc="gim - g interactive mode, aka the interactive REPL for g, the *permissive* git wrapper."
arch=('any')
url="https://github.com/jstmaxlol/gim"
license=('MIT')
makedepends=('git' 'gcc' 'vim')
source=("git+https://github.com/jstmaxlol/gim")
md5sums=('SKIP')

build() {
	cd "$srcdir/gim"
	gcc -o gim gim.c -w -O1
}

package() {
	install -Dm755 "$srcdir/gim/gim" "$pkgdir/usr/bin/gim"
}

