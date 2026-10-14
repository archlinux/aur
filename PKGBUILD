# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=gbild
pkgver=0.1
pkgrel=1
pkgdesc="GTK+ 2 image viewer"
url='https://codeberg.org/maandree/gbild'
arch=(i686 x86_64)
license=('custom:ISC')
depends=(libsimple gtk2 libgexiv2 librsvg)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(6d4f9877e358432b7019d1a1bc821f0ba645acbd05f891a2b0cc3143f4eb42b2)

build () {
	cd "$srcdir/gbild"
	make PREFIX=/usr
}

package () {
	cd "$srcdir/gbild"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
