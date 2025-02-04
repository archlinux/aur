# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libred
pkgver=1.1
pkgrel=1
pkgdesc="Solar elevation and blackbody colour calculation library for C"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/libred"
license=('ISC')
depends=()
makedepends=(sed)
source=(libred-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(f2d86d4ced439d92468bca94f7a870936576de16216d3c4c490c4e14127a01b3)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
