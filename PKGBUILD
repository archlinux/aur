# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=mongotimer
pkgver=1.1.4
pkgrel=1
pkgdesc='A humongous timer or stopwatch for the terminal'
arch=(any)
url='https://codeberg.org/maandree/mongotimer'
license=('custom:ISC')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(a5814feadbd8b742047e1e3e2c1273536d1fd14d22c05277517c6c0ab316bc4e)

build() {
    cd "$srcdir/mongotimer"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/mongotimer"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
