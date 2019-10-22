# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libcoopgamma
pkgver=1.2.1
pkgrel=1
pkgdesc="Cooperative gamma library"
arch=(i686 x86_64)
url="https://github.com/maandree/libcoopgamma"
license=('custom:ISC')
depends=(coopgammad)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(1129472a039c406ab088a31a1f4b4e010ac72ca87d64ba73893d4fbe63d5aa69)


build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make install DESTDIR="$pkgdir"
}
