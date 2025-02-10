# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libenv
pkgver=1.0.1
pkgrel=1
pkgdesc="Environment sanitation library"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/libenv"
license=('custom:ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(71db84e6ac04979f7dd699dc9348e09b0cc75844b91ef6e09c99a4200909384d)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
