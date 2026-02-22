# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libhaiku
pkgver=2.0.2
pkgrel=1
pkgdesc="Poetic error messages"
arch=(x86_64 i686)
url="https://codeberg.org/maandree/libhaiku"
license=('custom:ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(590cdef419c7eca2e2d50dd020e6ea05a4f516161be01d9b3f61e2201ce7887a)

build() {
    cd "$srcdir/$pkgname"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
