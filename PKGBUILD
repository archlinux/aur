# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=pylibcoopgamma
pkgver=1.1.4
pkgrel=1
pkgdesc="Cooperative gamma Python 3 library"
arch=(i686 x86_64 aarch64)
url="https://codeberg.org/maandree/pylibcoopgamma"
license=('custom:ISC')
depends=('python>=3.4' libcoopgamma)
makedepends=('python>=3.4' libcoopgamma cython)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(4e9efba315f6a0fb3ef9f89171e77fc5fef4561a1f725f1d67ff7d12fcb8caf8)


build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"
    make install DESTDIR="$pkgdir"
}
