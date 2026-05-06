#!/bin/bash
# Maintainer: czjstmax <jstmaxlol@disroot.org>, <maxwasmailed@proton.me>
pkgname=getg
pkgver=11_20.001
pkgrel=2
pkgdesc="g - the *permissive* git wrapper."
arch=('any')
url="https://kuronavipad.xantu-ling.ts.net/cgit/g.git"
license=('MIT')
makedepends=('git' 'gcc')
source=("git+https://kuronavipad.xantu-ling.ts.net/cgit/g.git")
md5sums=('SKIP')

build() {
	cd "$srcdir/g"
	gcc -o gim g.c -w -O1
}

package() {
	install -Dm755 "$srcdir/g/g" "$pkgdir/usr/bin/g"
}

