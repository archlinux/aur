# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=tidyselect
_cranver=0.2.4
pkgname=r-cran-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="A backend for the selecting functions of the 'tidyverse'."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL-3')
depends=('r>=3.1' 'r-cran-glue' 'r-cran-purrr' 'r-cran-rlang>=0.2.0' 'r-cran-rcpp>=0.12.0')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('fa3bfe6ea9f0e98a20e950788ea9573d')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
