#!/bin/bash
# Maintainer: jstmax! <jstmaxlol@disroot.org> & <maxwasmailed@proton.me>
pkgname=xsc
pkgver=3.5
pkgrel=0
pkgdesc="XSC: the aaaaaa-iest way to calculate stuff in the terminal"
arch=('any')
url="https://github.com/jstmaxlol/xsc"
license=('Unlicense')
depends=('figlet' 'lolcat')
makedepends=('git' 'gcc')
source=("git+https://github.com/jstmaxlol/xsc")
md5sums=('SKIP')

build() {
	cd "$srcdir/xsc"
	g++ -o xsc xsc.cpp -O2 -std=c++23
}

package() {
	install -Dm755 "$srcdir/xsc/xsc" "$pkgdir/usr/bin/xsc"
}
