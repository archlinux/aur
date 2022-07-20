# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=median
pkgver=2.0.1
pkgrel=1
pkgdesc="Calculate the median values for a set of groups"
arch=(x86_64)
url="https://codeberg.org/maandree/median"
license=(custom:ISC)
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(60d2d492e1aa2550090606c838e7ff52aa57497d8a8df0159957c08cb98f39ad)

build() {
    cd "$srcdir/$pkgname"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
