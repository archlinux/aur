# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libclut
pkgver=1.2.3
pkgrel=1
pkgdesc="C library for manipulating colour lookup tables"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/libclut"
license=('custom:ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(ba7a8933115e3fdce74c1f36f7b68b92743c517fc5fbc2dc433068baca545b4d)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
