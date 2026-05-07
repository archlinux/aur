# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libquanta
pkgver=1.0
pkgrel=1
pkgdesc="Colour quantisation library"
arch=(i686 x86_64 aarch64)
url="https://codeberg.org/maandree/libquanta"
license=('custom:ISC')
depends=(libj2)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(655d06ec84d9e095fc655d44e6d0439017f02a872f0f0ed9d4bad5604e69df29)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
