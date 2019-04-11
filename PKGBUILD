# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=glue
_cranver=1.3.1
pkgname=r-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="An implementation of interpreted string literals for R."
url="https://cran.r-project.org/package=glue"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r>=3.1')
optdepends=('r-testthat' 'r-covr' 'r-magrittr' 'r-crayon' 'r-knitr' 'r-rmarkdown' 'r-dbi' 'r-rsqlite' 'r-r.utils' 'r-forcats' 'r-microbenchmark' 'r-rprintf' 'r-stringr' 'r-ggplot2' 'r-dplyr' 'r-withr')
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('242edf3ba74c928b434c8cee138aa16e') 

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
