# Maintainer: M1829 <m1829js@gmail.com>
pkgname=mxset
pkgver=1.3.1
pkgrel=1
pkgdesc='An optimized hashset in C89, yielding maximum compatibility and great performance.'
arch=('x86_64' 'i686' 'aarch64')
url='https://codeberg.org/Muhamix/mxset'
license=('LGPL-3.0-or-later')
source=("$pkgname-$pkgver::https://codeberg.org/Muhamix/mxset/archive/v$pkgver.tar.gz")
sha256sums=('c92a0f8b62e9a255854c37c6b6ac8810483c10f9174095b48b675316e3a03a68')
options=('staticlibs')

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/include"
	make install PREFIX="$pkgdir/usr" CC=cc
}
