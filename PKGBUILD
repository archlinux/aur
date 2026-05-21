#!/bin/bash
# Maintainer: czjstmax <jstmaxlol@disroot.org>, <maxwasmailed@proton.me>
pkgname=getg
pkgver=11_20.001
pkgrel=3
pkgdesc="g - the *permissive* git wrapper."
arch=('any')
url="https://git.czkove.cc/g"
license=('MIT')
makedepends=('git' 'gcc')
source=("git+https://git.czkove.cc/g")
md5sums=('SKIP')

build() {
	cd "$srcdir/g"
	gcc -o gim g.c -w -O1
}

package() {
	install -Dm755 "$srcdir/g/g" "$pkgdir/usr/bin/g"
}


