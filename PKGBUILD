# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>
pkgname=python-arg
pkgver=1.0.2
pkgrel=1
pkgdesc="A simple argument parser for Python"
arch=('any')
url="https://codeberg.org/maandree/python-arg"
license=('custom:ISC')
depends=(python)
makedepends=(python python2)
source=($pkgbase-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(def24fe254a2e1a649366151e362e83ab7d1983b0187c057f20f6f60e0d3b04d)

build() {
    true
}

check() {
    cd "$srcdir/$pkgbase"
    make check
}

package() {
    cd "$srcdir/$pkgbase"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}
