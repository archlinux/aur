#!/bin/bash
# Maintainer: czjstmax : <jstmaxlol@disroot.org>, <maxwasmailed@proton.me>
pkgname=gim
pkgver=00001
pkgrel=3
pkgdesc="gim - g interactive mode, aka the interactive REPL for g, the *permissive* git wrapper."
arch=('any')
url="https://github.com/jstmaxlol/gim"
license=('MIT')
makedepends=('git' 'gcc' 'vim')
source=("git+https://github.com/jstmaxlol/gim")
md5sums=('SKIP')

build() {
	cd "$srcdir/gim"
	gcc -o gim gim.c -w -O1 -lncurses
}

package() {
	install -Dm755 "$srcdir/gim/gim" "$pkgdir/usr/bin/gim"
}

