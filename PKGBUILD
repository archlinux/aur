# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=vtchs
pkgver=1.1.4
pkgrel=1
pkgdesc="Listen for VT switches"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/vtchs"
license=('custom:ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(9da0640f004c32c2e8f23b7f5d92cbb7c39fda08d19ffa3c3284145bdf26cf3d)

build() {
    cd "$srcdir/$pkgname"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
