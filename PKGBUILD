# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=hms
_cranver=0.4.2
pkgname=r-cran-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="Implements an S3 class for storing and formatting time-of-day values, based on the 'difftime' class."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('r' 'r-cran-pkgconfig' 'r-cran-rlang')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('cb2583120e8089a6cd4c7e968b6eb950') 

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
