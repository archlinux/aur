# Maintainer: M1829 <m1829js@gmail.com>
pkgname=mxset
pkgver=1.11.0
pkgrel=4
pkgdesc='An optimized hashset in GNU C99, using a SwissTable style open-addressing architecture.'
arch=('x86_64' 'i686' 'aarch64')
url='https://codeberg.org/Muhamix/mxset'
license=('LGPL-3.0-or-later')
source=("$pkgname-$pkgver::https://codeberg.org/Muhamix/mxset/archive/v$pkgver.tar.gz")
sha256sums=('5ea7b8612647a3d4c3140931a7fc64c61f418d0ee7e511057df92f1186a90078')
options=('staticlibs')
conflicts=('mxset-cpp')

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/include"
	make install PREFIX="$pkgdir/usr" CC=cc
}
