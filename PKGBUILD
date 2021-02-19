# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=mongoclock
pkgver=3.1.1
pkgrel=1
pkgdesc='Just a humongous clock for the terminal'
arch=(any)
url='https://github.com/maandree/mongoclock'
license=('custom:ISC')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(ad3715c29652bb548ad43a2f74b040505e7824de25e78d8df3c9c26e6d79d642)

build() {
    cd "$srcdir/mongoclock-$pkgver"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/mongoclock-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
