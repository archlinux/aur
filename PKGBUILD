# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=mongotimer
pkgver=1.2
pkgrel=1
pkgdesc='A humongous timer or stopwatch for the terminal'
arch=(any)
url='https://codeberg.org/maandree/mongotimer'
license=('custom:ISC')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(f0893648597586efd2dd8e073bfa3630d398ee6888e311953128af359c89ce8d)

build() {
    cd "$srcdir/mongotimer"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/mongotimer"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
