# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=mongoclock
pkgver=3.1.6
pkgrel=1
pkgdesc='Just a humongous clock for the terminal'
arch=(any)
url='https://codeberg.org/maandree/mongoclock'
license=('custom:ISC')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(f9b5c40aa69f2f2875e43b427c4cc5bcb1917960d9492fc49e7f7527d5bfddbd)

build() {
    cd "$srcdir/mongoclock"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/mongoclock"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
