# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=luhncheck
pkgver=1.0.1
pkgrel=1
pkgdesc="Check number with Luhn's algorithm"
url='https://codeberg.org/maandree/luhncheck'
arch=(i686 x86_64 aarch64)
license=('custom:ISC')
depends=()
makedepends=(libsimple)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(17fac8d16748b99c4176a9ef222b413ca052c50a64648c79b1589906ea19f52f)

build () {
	cd "$srcdir/luhncheck"
	make PREFIX=/usr
}

package () {
	cd "$srcdir/luhncheck"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
