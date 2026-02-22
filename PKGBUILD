# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libred
pkgver=1.1.3
pkgrel=1
pkgdesc="Solar elevation and blackbody colour calculation library for C"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/libred"
license=('custom:ISC')
depends=()
makedepends=(sed)
source=(libred-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(f27665720ade37a0b949f59a821e9af55aa7e7751559e837590d3d54d4d049ea)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
