# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=gluhncheck
pkgver=1.0.1
pkgrel=1
pkgdesc="Check number with Luhn's algorithm"
url='https://codeberg.org/maandree/gluhncheck'
arch=(i686 x86_64)
license=('custom:ISC')
depends=(gtk2)
makedepends=(libsimple)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(1f621bc7cc6529da5260ffb3cf41f8ccfbe027549917478043775e9d51ea0faf)

build () {
	cd "$srcdir/gluhncheck"
	make PREFIX=/usr
}

package () {
	cd "$srcdir/gluhncheck"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
