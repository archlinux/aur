# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libparser
pkgver=1.1.2
pkgrel=1
pkgdesc="Right-context-sensitive grammar parsing library"
arch=(x86_64)
url="https://codeberg.org/maandree/libparser"
license=('ISC')
depends=()
checkdepends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(6610809e88d0ca7d3bf3cd2597fa95a8ba235b9c1d3a0a4502831010ec553e15)

build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
