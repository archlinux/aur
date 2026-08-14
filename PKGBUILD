# Maintainer: M1829 <m1829js@gmail.com>
pkgname=mxset
pkgver=1.11.0
pkgrel=4
pkgdesc='An optimized hashset in GNU C99, using a SwissTable style open-addressing architecture.'
arch=('x86_64' 'i686' 'aarch64')
url='https://codeberg.org/Muhamix/mxset'
license=('LGPL-3.0-or-later')
source=("$pkgname-$pkgver::https://codeberg.org/Muhamix/mxset/archive/v$pkgver.tar.gz")
sha256sums=('3958d09310612afd0499ecdbb57dc6722a8ddf4ec9592b28641183580f0b4edd')
options=('staticlibs')
conflicts=('mxset-cpp')

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/include"
	make install PREFIX="$pkgdir/usr" CC=cc
}
