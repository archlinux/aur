# Maintainer: M1829 <m1829js@gmail.com>
pkgname=mxset-cpp
pkgver=1.3.0
pkgrel=2
pkgdesc='MXSet is an optimized hashset library in GNU C89, yielding maximum compatibility and great performance, these are C++ bindings for that library.'
arch=('x86_64' 'i686' 'aarch64')
url='https://codeberg.org/Muhamix/mxset'
license=('LGPL-3.0-or-later')
source=("$pkgname-$pkgver::https://codeberg.org/Muhamix/mxset/archive/v$pkgver.tar.gz")
sha256sums=('8fbceb161f084a64791ecc80d9eaa592fd81e9d78d5a56c9aad9fa355c4ce7cb')
options=('staticlibs')

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/include"
	make cpp-install PREFIX="$pkgdir/usr" CXX=c++ CC=cc
}
