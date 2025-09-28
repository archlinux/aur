#!/bin/bash
# Maintainer: jstmax! / ceez2exzt -> maxwasmailed@proton.me
pkgname=pacdo
pkgver=2025.09.2904
pkgrel=0
pkgdesc="a simple cli utility to shorten pacman syntax."
arch=('any')
url="https://github.com/jstmaxlol/pacdo"
license=('Unlicense')
optdepends=('figlet: cooler logo in usage screen') 
makedepends=('git' 'gcc')
source=("git+https://github.com/jstmaxlol/pacdo")
md5sums=('SKIP')

build() {
	cd "$srcdir/pacdo"
	g++ -o pacdo pacdo.cpp
}

package() {
	install -Dm755 "$srcdir/pacdo/pacdo" "$pkgdir/usr/bin/pacdo"
}
