# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=broom
_cranver=0.4.4
pkgname=r-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="Convert statistical analysis objects into tidy data frames."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r' 'r-plyr' 'r-dplyr' 'r-tidyr' 'r-psych' 'r-stringr' 'r-reshape2')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('d2f222b2512ad35230856d94690213b5') 

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
