# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=timeDate
_cranver=3043.102
pkgname=r-cran-timedate
pkgver=${_cranver}
pkgrel=1
pkgdesc="Rmetrics - Chronological and Calendar Objects"
url="https://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('x86_64')
license=('GPL3')
depends=('r')
# optdepends on date and RUnit
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('7808ada851cbf740b1360cabca0706ff')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
