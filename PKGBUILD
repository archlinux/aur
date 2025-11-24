#!/bin/bash
# Maintainer: czjstmax <jstmaxlol@disroot.org>, <maxwasmailed@proton.me>
pkgname=fbd
pkgver=1
pkgrel=1
pkgdesc="FuckBuild - a minimal build system (wrapper) for gcc/g++, written in bash."
arch=('any')
url="https://github.com/jstmaxlol/FuckBuild"
license=('Unlicense')
makedepends=('bash' 'gcc')
source=("git+https://github.com/jstmaxlol/FuckBuild")
md5sums=('SKIP')

build() {
	cd "$srcdir/FuckBuild"
}

package() {
	install -Dm755 "$srcdir/FuckBuild/fbd.sh" "$pkgdir/usr/bin/fbd"
}

