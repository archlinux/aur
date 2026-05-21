# Maintainer: M1829 <m1829js@gmail.com>
pkgname=mxset
pkgver=1.6.3
pkgrel=1
pkgdesc='An optimized hashset in C89, yielding maximum compatibility and great performance.'
arch=('x86_64' 'i686' 'aarch64')
url='https://codeberg.org/Muhamix/mxset'
license=('LGPL-3.0-or-later')
source=("$pkgname-$pkgver::https://codeberg.org/Muhamix/mxset/archive/v$pkgver.tar.gz")
sha256sums=('937cf8216ed9ec069677e7a1bb44a1d3139a12fa4be6d41f6daadabf090abd13')
options=('staticlibs')
conflicts=('mxset-cpp')

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/include"
	make install PREFIX="$pkgdir/usr" CC=cc
}
