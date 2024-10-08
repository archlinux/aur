# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=liberror-backtrace
pkgver=1.0.0.1
pkgrel=1
pkgdesc="Backtrace support for liberror"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/liberror-backtrace"
license=('ISC')
depends=()
checkdepends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(6076c2870f51f744478e11335b46bf1f76e3130ca6766fa415b978a790772195)

build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
