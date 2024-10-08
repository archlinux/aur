# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=dlu
pkgver=1.0.1
pkgrel=1
pkgdesc="Program for quickly looking up words in scanned dictionaries"
arch=(any)
url="https://github.com/maandree/dlu"
license=('custom:ISC')
depends=(python3)
makedepends=()
source=($url/archive/$pkgver.tar.gz)
sha256sums=(5db79718b3eb67fae61eb5686c0aa4752be952bca7ba77a065e2c4cf7bbd72fb)


package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install DESTDIR="$pkgdir"
}

