# Maintainer: Sukanka <su975853527 [AT] gmail.com>
pkgname=yaggo
pkgver=1.5.10
pkgrel=1
pkgdesc="Yet Another GenGetOpt"
arch=("any")
url='https://github.com/gmarcais/yaggo'
license=('GPL3')
depends=(ruby)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gmarcais/yaggo/archive/refs/tags/v${pkgver}.tar.gz"
)
sha512sums=('56e8f187cf0169ec6ba3e129af0e74e34d6828c672fa7dc12e634ee96a3960c83695bc2f64767fb77c09c3afd046b52f0033801fd624182584c2c3e46b282395')

package(){
    cd $srcdir/${pkgname}-${pkgver}
    make install prefix=${pkgdir}/usr
}
