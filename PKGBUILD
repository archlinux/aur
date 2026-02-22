# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=median
pkgver=2.0.2
pkgrel=1
pkgdesc="Calculate the median values for a set of groups"
arch=(x86_64)
url="https://codeberg.org/maandree/median"
license=(custom:ISC)
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(e9612370912c642f155540601e8ad1cc7b1739e97b77eecbdd8f23e0ab03a23c)

build() {
    cd "$srcdir/$pkgname"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
