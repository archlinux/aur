# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=read-quickly
pkgver=2.0
pkgrel=1
pkgdesc='Read plain-text files in blazing speed'
arch=('i686' 'x86_64')
url='https://github.com/maandree/read-quickly'
license=('custom:ISC')
depends=()
makedepends=()
source=(https://github.com/maandree/read-quickly/archive/$pkgver.tar.gz)
sha256sums=(1f7b755a61c19c995aa973ed22b5e662178c4e66252bd4a8345c968d4f45d699)


build() {
  cd "$srcdir/read-quickly-$pkgver"
  make
}

package() {
  cd "$srcdir/read-quickly-$pkgver"
  make DESTDIR="$pkgdir" install
}
