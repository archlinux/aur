#!/bin/bash
# Maintainer: jstmax! / ceez2exzt -> maxwasmailed@proton.me
pkgname=xsc
pkgver=3.4
pkgrel=0
pkgdesc="XSC: the easiest way to calculate stuff in the terminal"
arch=('any')
url="https://github.com/jstmaxlol/xsc"
license=('Unlicense')
depends=('figlet' 'lolcat')
makedepends=('git' 'gcc')
source=("git+https://github.com/jstmaxlol/xsc")
md5sums=('SKIP')

build() {
	cd "$srcdir/xsc"
	g++ -o xsc xsc.cpp -O2
}

package() {
	install -Dm755 "$srcdir/xsc/xsc" "$pkgdir/usr/bin/xsc"
}
