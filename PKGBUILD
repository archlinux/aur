# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libclut
pkgver=1.2
pkgrel=1
pkgdesc="C library for manipulating colour lookup tables"
arch=(i686 x86_64)
url="https://github.com/maandree/libclut"
license=('ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(efb1b8b81c16a329e676bc56b6b546086da096ec58ee76f6869f10bfa5954235)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install PREFIX=/usr DESTDIR="$pkgdir"
}
