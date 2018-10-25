# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=tidyselect
_cranver=0.2.5
pkgname=r-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="A backend for the selecting functions of the 'tidyverse'."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL-3')
depends=('r>=3.1' 'r-glue>=1.3.0' 'r-purrr' 'r-rlang>=0.2.2' 'r-rcpp>=0.12.0')
optdepends=('r-covr' 'r-dplyr' 'r-testthat')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('8a7d4060a5ed016cf4adeaf6014ca89c')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
