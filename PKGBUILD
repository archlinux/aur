# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=pylibcoopgamma
pkgver=1.1.3.2
pkgrel=1
pkgdesc="Cooperative gamma Python 3 library"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/pylibcoopgamma"
license=('ISC')
depends=('python>=3.4' libcoopgamma)
makedepends=('python>=3.4' libcoopgamma cython)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=(55612e83efbcd00749a87217810d8ea4e228784804c3bc39199e1ecda1ecf964a5f1ced30d027370111e0c01e78c9e5f8d6659e970dbba895d4dbab7d31f8815)


build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"
    make install DESTDIR="$pkgdir"
}
