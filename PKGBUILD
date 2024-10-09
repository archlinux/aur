# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=vtchs
pkgver=1.1.3
pkgrel=1
pkgdesc="Listen for VT switches"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/vtchs"
license=('custom:ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(cbc2f73fbf991e8f467177999d92f954d7839839ee9c1c79e537f3919f1b83b7)

build() {
    cd "$srcdir/$pkgname"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
