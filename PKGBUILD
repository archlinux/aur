# Maintainer: Sukanka <su975853527 [AT] gmail.com>
pkgname=yaggo
pkgver=1.5.11
pkgrel=1
pkgdesc="Yet Another GenGetOpt"
arch=("any")
url='https://github.com/gmarcais/yaggo'
license=('GPL-3.0-or-later')
depends=(ruby)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gmarcais/yaggo/archive/refs/tags/v${pkgver}.tar.gz"
)
sha512sums=('c2f85adf1968e290e89e997391ca9324621e2ae9185481cb1d28bf2d4a7dd1455a8e1fc154f9f8fe3c7d1694d0bc2487ac0827d28c7ea6cd636a942af09ce5e3')

package() {
    cd $srcdir/${pkgname}-${pkgver}
    make install prefix=${pkgdir}/usr
}
