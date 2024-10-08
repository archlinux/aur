# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=bus
pkgver=3.1.10
pkgrel=1
pkgdesc="A simple daemonless system for broadcasting messages locally"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/bus"
license=('ISC')
depends=()
makedepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(95c06c897823c685ef3087d42fd8272b87961d6a62d8603b6be8b9f67c768e3a)

build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
