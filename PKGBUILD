# Maintainer: Adrián Arroyo Calle <adrian.arroyocalle@gmail.com>

pkgname=trealla
pkgver=2.48.6
pkgrel=1
pkgdesc="A compact, efficient Prolog interpreter with ISO compliant aspirations."
arch=('i686' 'x86_64')
url="https://github.com/trealla-prolog/trealla"
license=('MIT')
depends=('glibc' 'readline' 'vim' 'openssl')
makedepends=('gcc' 'make')
source=(https://github.com/trealla-prolog/trealla/archive/v${pkgver}.tar.gz)
sha256sums=('7508ece987157e888e870964219bf481d5a0e9df27817c76c26bf8e8d1806c4e')

build() {
    cd $srcdir/trealla-$pkgver

    make
}

package() {
    mkdir -p $pkgdir/usr/bin
    cp $srcdir/trealla-$pkgver/tpl $pkgdir/usr/bin/
}
