# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=median
pkgver=2.0
pkgrel=1
pkgdesc="Calculate the median values for a set of groups"
arch=(x86_64)
url="https://github.com/maandree/median"
license=(custom:ISC)
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(fcbdc9116b3eb5503fcb98a198ae45ecdf1a46116a307299904e1ba77204ee7e)

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
