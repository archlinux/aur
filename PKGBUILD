# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=gluhncheck
pkgver=1.0
pkgrel=1
pkgdesc="Check number with Luhn's algorithm"
url='https://codeberg.org/maandree/gluhncheck'
arch=(i686 x86_64)
license=('custom:ISC')
depends=(gtk2)
makedepends=(libsimple)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(06ccf4a7eaa0f8def9567234ade1b56c0e8f4fca1ad3c4e6d1941e9b85a9ca75)

build () {
	cd "$srcdir/gluhncheck"
	make PREFIX=/usr
}

package () {
	cd "$srcdir/gluhncheck"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
