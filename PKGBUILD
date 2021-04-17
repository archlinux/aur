# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=mongotimer
pkgver=1.1.2
pkgrel=1
pkgdesc='A humongous timer or stopwatch for the terminal'
arch=(any)
url='https://github.com/maandree/mongotimer'
license=('custom:ISC')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(feae7f899d579a3dc9479a431e14bca13b0ef815ed3c039e0d94a690d412e773)

build() {
    cd "$srcdir/mongotimer-$pkgver"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/mongotimer-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
