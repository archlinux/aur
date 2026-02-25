# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=dlu
pkgver=1.1
pkgrel=1
pkgdesc="Program for quickly looking up words in scanned dictionaries"
arch=(any)
url="https://codeberg.org/maandree/dlu"
license=('custom:ISC')
depends=(python3)
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(dacdab0b1a0ec0186da9b337bdeb13defc6453cc85ebb3c2cae9e37f82434c1c)


package() {
	cd "$srcdir/$pkgname"
	make install DESTDIR="$pkgdir"
}

