# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=mongoclock
pkgver=3.1.5
pkgrel=1
pkgdesc='Just a humongous clock for the terminal'
arch=(any)
url='https://codeberg.org/maandree/mongoclock'
license=('custom:ISC')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(777d59f3453f9282c35bcfa124da6b3c3860ac5cbcc613258bc6485bfaf063d2)

build() {
    cd "$srcdir/mongoclock"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/mongoclock"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
