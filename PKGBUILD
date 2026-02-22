# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=liberror-backtrace
pkgver=1.0.1
pkgrel=1
pkgdesc="Backtrace support for liberror"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/liberror-backtrace"
license=('custom:ISC')
depends=()
checkdepends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(81b3360e9d48534ca3ea3fcf2a782efb7aabc1414669d6617f3efd81f580926b)

build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
