# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=liberror
pkgver=1.1.1
pkgrel=1
pkgdesc="Library for custom errors"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/liberror"
license=('ISC')
depends=()
checkdepends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(3af9a50b44b086c37698b6df097edba29a9208aa36b28e38ae1b470e77348e27)

build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
