# Maintainer: M1829 <m1829js@gmail.com>
pkgname=mxset
pkgver=1.11.0
pkgrel=1
pkgdesc='An optimized hashset in GNU C99, using a SwissTable style open-addressing architecture.'
arch=('x86_64' 'i686' 'aarch64')
url='https://codeberg.org/Muhamix/mxset'
license=('LGPL-3.0-or-later')
source=("$pkgname-$pkgver::https://codeberg.org/Muhamix/mxset/archive/v$pkgver.tar.gz")
sha256sums=('a44e5cad1c043bd1a29d7c7819997b0afd2ee22352f011631bcfd82c66b5111c')
options=('staticlibs')
conflicts=('mxset-cpp')

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/include"
	make install PREFIX="$pkgdir/usr" CC=cc
}
