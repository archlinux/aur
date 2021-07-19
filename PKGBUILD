# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=mongotimer
pkgver=1.1.3
pkgrel=1
pkgdesc='A humongous timer or stopwatch for the terminal'
arch=(any)
url='https://github.com/maandree/mongotimer'
license=('custom:ISC')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(79bc505393595c6eea47bb0d11adad39b8d7ff6d8dfab907b5411020477dcd94)

build() {
    cd "$srcdir/mongotimer-$pkgver"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/mongotimer-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
