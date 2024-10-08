# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libhaiku
pkgver=2.0.1.1
pkgrel=1
pkgdesc="Poetic error messages"
arch=(x86_64 i686)
url="https://codeberg.org/maandree/libhaiku"
license=('ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(cfdcd543bc9d92880c9e8b4d173c4b2cce44f48e2ebb12f68f692dbfcb8d49fd)

build() {
    cd "$srcdir/$pkgname"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
