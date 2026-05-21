#!/bin/bash
# Maintainer: czjstmax <jstmaxlol at disroot dot org>
pkgname=xsc
pkgver=3.5
pkgrel=2
pkgdesc="XSC: the aaaaaa-iest way to calculate stuff in the terminal"
arch=('any')
url="https://git.czkove.cc/xsc"
license=('Unlicense')
depends=('figlet' 'lolcat')
makedepends=('git' 'gcc')
conflicts=('sc-git')                    # pointed out by user bkb <pingo-power at hotmail dot fr>
source=("git+https://git.czkove.cc/xsc")
md5sums=('SKIP')

build() {
	cd "$srcdir/xsc"
	g++ -o xsc xsc.cpp -O2 -std=c++23
}

package() {
	install -Dm755 "$srcdir/xsc/xsc" "$pkgdir/usr/bin/xsc"
}
