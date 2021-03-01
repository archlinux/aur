# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libhaiku
pkgver=2.0
pkgrel=1
pkgdesc="Poetic error messages"
arch=(x86_64 i686)
url="https://github.com/maandree/libhaiku"
license=('custom:ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(c5988a22d0bb56f4e2d1555e58beb00b9ab62d301f05739c4c127443ef4d2bec)

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make install PREFIX=/usr DESTDIR="$pkgdir"
}
