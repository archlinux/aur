# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWUK).se>

pkgname=nightshift
pkgver=0.6.1
pkgrel=1
pkgdesc="A terminal user interface for redshift"
arch=(any)
url="https://codeberg.org/maandree/nightshift"
license=('custom:ISC')
depends=(python3 redshift)
makedepends=(zip auto-auto-complete)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(a5721ec588dc4e42cddfa7bafd0571393edf18c2ff31f63f9e8eb84d177410f3)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
