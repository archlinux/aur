# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=broom
_cranver=0.4.2
pkgname=r-cran-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="Convert statistical analysis objects into tidy data frames."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r' 'r-cran-dplyr' 'r-cran-nlme' 'r-cran-plyr' 'r-cran-psych' 'r-cran-reshape2' 'r-cran-tidyr' 'r-stringr')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('6eabab1f2eaec10f93cf9aa56d6a61de') 

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
