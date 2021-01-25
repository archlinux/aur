# Maintainer: Thomas Ivesdal-Tronstad <thotro at lyse dot net>
# Contributor Thomas Ivesdal-Tronstad <thotro at lyse dot net>
_cranname=pracma
_cranver=2.3.3
pkgname=r-pracma
pkgver=${_cranver}
pkgrel=1
pkgdesc="Provides a large number of functions."
url="https://cran.r-project.org/package=pracma"
arch=('i686' 'x86_64')
license=('GPL-2' 'GPL-3')
depends=('r>=3.1.0')
optdepends=()
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('cf1f8d7724a385d9a2e1a5496d9ba0e9908940b85669fb2c506b9059722cb93c')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}

