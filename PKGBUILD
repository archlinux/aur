#!/bin/bash
# Maintainer: czjstmax <jstmaxlol@disroot.org>, <maxwasmailed@proton.me>
pkgname=getg
pkgver=11-20.001
pkgrel=1
pkgdesc="g - the *permissive* git wrapper."
arch=('any')
url="https://github.com/jstmaxlol/g"
license=('MIT')
makedepends=('git' 'gcc')
source=("git+https://github.com/jstmaxlol/g")
md5sums=('SKIP')

build() {
	cd "$srcdir/g"
	gcc -o gim g.c -w -O1
}

package() {
	install -Dm755 "$srcdir/g/g" "$pkgdir/usr/bin/g"
}

