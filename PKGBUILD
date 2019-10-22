# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=pylibcoopgamma
pkgver=1.1.2
pkgrel=1
pkgdesc="Cooperative gamma Python 3 library"
arch=(i686 x86_64)
url="https://github.com/maandree/pylibcoopgamma"
license=('custom:ISC')
depends=('python>=3.4' libcoopgamma)
makedepends=('python>=3.4' libcoopgamma cython)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(4da52548106e4a430aec6a302d33f7a4e034942c9cd507ccb8478b1cde5b29a7)


build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make install DESTDIR="$pkgdir"
}
