# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=mongotimer
pkgver=1.2.1
pkgrel=1
pkgdesc='A humongous timer or stopwatch for the terminal'
arch=(any)
url='https://codeberg.org/maandree/mongotimer'
license=('custom:ISC')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(192d508a08691b60c892d3eb272da6da3dd960e8ed340e1728398eff2b38d504)

build() {
    cd "$srcdir/mongotimer"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/mongotimer"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
