# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libcoopgamma
pkgver=1.2.2.1
pkgrel=1
pkgdesc="Cooperative gamma library"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/libcoopgamma"
license=('ISC')
depends=(coopgammad)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(8518797010b864e536eba9011875ada92d361e24880e43c81b5b3f08ed1b2493)


build() {
    cd "$srcdir/$pkgname"
    make
}

check() {
    cd "$srcdir/$pkgname"
    make check
}

package() {
    cd "$srcdir/$pkgname"
    make install DESTDIR="$pkgdir"
}
