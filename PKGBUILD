# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libred
pkgver=1.0.3
pkgrel=1
pkgdesc="Solar elevation and blackbody colour calculation library for C"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/libred"
license=('ISC')
depends=()
makedepends=(sed)
source=(libred-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(3552bb05196a80c367f91b0edf8ef34ba53d95656f5d0898bec50c4952c0d29c)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
