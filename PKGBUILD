# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=mongoclock
pkgver=3.1.3
pkgrel=1
pkgdesc='Just a humongous clock for the terminal'
arch=(any)
url='https://github.com/maandree/mongoclock'
license=('custom:ISC')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(5f8d080d8ec07bacf34eff618a63a4cc01ee828675c94031350128bd1e292c10)

build() {
    cd "$srcdir/mongoclock-$pkgver"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/mongoclock-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
