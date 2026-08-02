# Maintainer: M1829 <m1829js@gmail.com>
pkgname=mxset
pkgver=1.9.4
pkgrel=1
pkgdesc='An optimized hashset in GNU C89, using a SwissTable style open-addressing architecture.'
arch=('x86_64' 'i686' 'aarch64')
url='https://codeberg.org/Muhamix/mxset'
license=('LGPL-3.0-or-later')
source=("$pkgname-$pkgver::https://codeberg.org/Muhamix/mxset/archive/v$pkgver.tar.gz")
sha256sums=('4d95553dd465e4565d7cd8801cac7aae92de9b91d074fdfd10d375367f90ffef')
options=('staticlibs')
conflicts=('mxset-cpp')

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/include"
	make install PREFIX="$pkgdir/usr" CC=cc
}
