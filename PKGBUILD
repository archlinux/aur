# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=libundo
pkgver=0.8.2
pkgrel=2
pkgdesc="Adds undo support to gracegtk"
arch=(i686 x86_64)
url="http://plasma-gate.weizmann.ac.il/Grace/"
depends=('glibc')
license=('GPL')
source=(ftp://plasma-gate.weizmann.ac.il/pub/grace/src/devel/$pkgname/$pkgname-$pkgver.tar.gz)

build() {
	cd "$srcdir"/$pkgname-$pkgver
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir"/$pkgname-$pkgver
	make DESTDIR="$pkgdir" install
}
md5sums=('8d26e45e66d31ec5593f28a6a11e05a2')
