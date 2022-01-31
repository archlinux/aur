# Maintainer: Adrián Arroyo Calle <adrian.arroyocalle@gmail.com>

pkgname=trealla
pkgver=1.20.31
pkgrel=1
pkgdesc="A compact, efficient Prolog interpreter with ISO compliant aspirations."
arch=('i686' 'x86_64')
url="https://github.com/infradig/trealla"
license=('MIT')
depends=('glibc' 'readline' 'vim' 'openssl')
makedepends=('gcc' 'make')
source=(https://github.com/infradig/trealla/archive/v${pkgver}.tar.gz)
sha256sums=('9e406075ec33c81c5fdeab960329b773801f2a2a45824f7cb5196199c3f6e011')

build() {
    cd $srcdir/trealla-$pkgver

    make
}

package() {
    mkdir -p $pkgdir/usr/bin
    cp $srcdir/trealla-$pkgver/tpl $pkgdir/usr/bin/
}
