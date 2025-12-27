# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=luhncheck
pkgver=1.0
pkgrel=1
pkgdesc="Check number with Luhn's algorithm"
url='https://codeberg.org/maandree/luhncheck'
arch=(i686 x86_64)
license=('custom:ISC')
depends=()
makedepends=(libsimple)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(314c91ff2b2ecb64a38ee50bf1089f52c323565778ff878d1b3e0aa0ede1db67)

build () {
	cd "$srcdir/luhncheck"
	make PREFIX=/usr
}

package () {
	cd "$srcdir/luhncheck"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
