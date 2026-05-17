# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libenv
pkgver=1.0.3.1
pkgrel=1
pkgdesc="Environment sanitation library"
arch=(i686 x86_64 aarch64)
url="https://codeberg.org/maandree/libenv"
license=('custom:ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(373ed7338e1721b27303b3ac6a796cb3ac74d6bb668a46c4d36172f2d0582e48)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
