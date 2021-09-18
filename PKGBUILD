# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=median
pkgver=2.0.1
pkgrel=1
pkgdesc="Calculate the median values for a set of groups"
arch=(x86_64)
url="https://github.com/maandree/median"
license=(custom:ISC)
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(1b9dec4912934057f430ef76bed717f6b3c69945768176b8b77bb67049e567b2)

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
