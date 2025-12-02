# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libred
pkgver=1.1.2
pkgrel=1
pkgdesc="Solar elevation and blackbody colour calculation library for C"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/libred"
license=('custom:ISC')
depends=()
makedepends=(sed)
source=(libred-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(45991dcd3cc30a7650a8149ba0af9ddf1c6d3b489ae847940465245abc994ed1)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
