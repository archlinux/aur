# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libenv
pkgver=1.0
pkgrel=1
pkgdesc="Environment sanitation library"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/libenv"
license=('custom:ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(8a1bc85ba076d2369dad3770fe81256e58e7b8154ab05bca8ffb6e1e1b881f45)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
