# Maintainer: Taekyung Kim <Taekyung.Kim.Maths@gmail.com>

_cranname=ISLR
_cranver=1.2
pkgname=r-islr
pkgver=${_cranver}
pkgrel=1
pkgdesc="the collection of data-sets used in the book 'An Introduction to Statistical Learning with Applications in R'"
url="https://cran.r-project.org/package=ISLR"
arch=('i686' 'x86_64')
license=('GPL-2')
depends=('r>=2.10')
optdepends=('r-mass')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('3d2e50066c9fd712ebe9a7d6559c3194')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
