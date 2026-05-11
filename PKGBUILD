# Maintainer: M1829 <m1829js@gmail.com>
pkgname=mxset
pkgver=1.2.3
pkgrel=3
pkgdesc='An optimized hashset in C89, yielding maximum compatibility and great performance.'
arch=('x86_64' 'i686' 'aarch64')
url='https://codeberg.org/Muhamix/mxset'
license=('LGPL-3.0-or-later')
source=("$pkgname-$pkgver::https://codeberg.org/Muhamix/mxset/archive/v$pkgver.tar.gz")
sha256sums=('d7ea1fdf6ed87c6262ff972438a8725db5099e481c9c635dac34e01488e0440a')
options=('staticlibs')

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/include"
	make install PREFIX="$pkgdir/usr" CC=cc
}
