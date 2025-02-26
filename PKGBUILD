# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libcolour
pkgver=2.3
pkgrel=2
pkgdesc="A C colour space library"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/libcolour"
license=('custom:ISC')
depends=()
makedepends=(sed python)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(6ed03efc496d475cfcd7619bb646ebec2f54cd0bf5e6305a53db99887e6b4de8)

build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
