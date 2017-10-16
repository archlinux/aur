# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=mongoclock
pkgver=2.3
pkgrel=1
pkgdesc='Just a humongous clock for the terminal'
arch=(any)
url='https://github.com/maandree/mongoclock'
license=('custom:ISC')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(38a438cb3441681621c38eca2047e7504724fbb12da8ac6c60316aaeebc0f95f)

build() {
    cd "$srcdir/mongoclock-$pkgver"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/mongoclock-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
