# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=read-quickly
pkgver=2.0
pkgrel=2
pkgdesc='Read plain-text files in blazing speed'
arch=('i686' 'x86_64')
url='https://codeberg.org/maandree/read-quickly'
license=('custom:ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(94fa8a112ecb56f3a041bea6ddb145878a35dd0ae24446a3d93b72d65ca97762)


build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}
