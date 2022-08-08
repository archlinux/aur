# Maintainer: Adrián Arroyo Calle <adrian.arroyocalle@gmail.com>

pkgname=trealla
pkgver=2.0.0
pkgrel=1
pkgdesc="A compact, efficient Prolog interpreter with ISO compliant aspirations."
arch=('i686' 'x86_64')
url="https://github.com/infradig/trealla"
license=('MIT')
depends=('glibc' 'readline' 'vim' 'openssl')
makedepends=('gcc' 'make')
source=(https://github.com/trealla-prolog/trealla/archive/v${pkgver}.tar.gz)
sha256sums=('92afc2ebb5215d7e32f9d36ebcc85c9c6f820558a5389f0edc7a0bd35ecfb9e9')

build() {
    cd $srcdir/trealla-$pkgver

    make
}

package() {
    mkdir -p $pkgdir/usr/bin
    cp $srcdir/trealla-$pkgver/tpl $pkgdir/usr/bin/
}
