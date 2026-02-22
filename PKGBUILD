# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=liberror
pkgver=1.1.2
pkgrel=1
pkgdesc="Library for custom errors"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/liberror"
license=('custom:ISC')
depends=()
checkdepends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(f73e04e6690946e814f19e4da834d16806b47ec2f442c29ce6ef646b1b949c4a)

build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
