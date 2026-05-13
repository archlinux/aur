# Maintainer: M1829 <m1829js@gmail.com>
pkgname=mxset-cpp
pkgver=1.3.1
pkgrel=1
pkgdesc='MXSet is an optimized hashset library in GNU C89, yielding maximum compatibility and great performance, these are C++ bindings for that library.'
arch=('x86_64' 'i686' 'aarch64')
url='https://codeberg.org/Muhamix/mxset'
license=('LGPL-3.0-or-later')
source=("$pkgname-$pkgver::https://codeberg.org/Muhamix/mxset/archive/v$pkgver.tar.gz")
sha256sums=('c92a0f8b62e9a255854c37c6b6ac8810483c10f9174095b48b675316e3a03a68')
options=('staticlibs')

package() {
	cd "$srcdir/mxset"
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/include"
	make cpp-install PREFIX="$pkgdir/usr" CXX=c++ CC=cc
}
