# Maintainer: Thomas Ivesdal-Tronstad <thotro at lyse dot net>
# Contributor Thomas Ivesdal-Tronstad <thotro at lyse dot net>
_cranname=pracma
_cranver=2.2.5
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
sha256sums=('2fe83e3a556f5aab3ba4c9867630283c78c9a13912c04991daf55712811e4d47')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}

