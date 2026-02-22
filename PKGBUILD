# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=read-quickly
pkgver=2.0.1
pkgrel=1
pkgdesc='Read plain-text files in blazing speed'
arch=('i686' 'x86_64')
url='https://codeberg.org/maandree/read-quickly'
license=('custom:ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(90cbb457dc6419e3b4fdc3dae72ec02b577530b8be147ca7455668218186bdcb)


build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}
