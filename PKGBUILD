# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=pylibcoopgamma
pkgver=1.1.3.1
pkgrel=1
pkgdesc="Cooperative gamma Python 3 library"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/pylibcoopgamma"
license=('ISC')
depends=('python>=3.4' libcoopgamma)
makedepends=('python>=3.4' libcoopgamma cython)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(2996f732b9ff8a02c9906633d684ff764871018f30da91b0df9f1406766d0958)


build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"
    make install DESTDIR="$pkgdir"
}
