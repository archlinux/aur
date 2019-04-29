# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=tidyr
_cranver=0.8.3
pkgname=r-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="An evolution of 'reshape2'. It's designed specifically for data tidying (not general reshaping or aggregating) and works well with 'dplyr' data pipelines."
url="https://cran.r-project.org/package=tidyr"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r>=3.1.0' 'r-dplyr>=0.7.0' 'r-glue' 'r-magrittr' 'r-purrr' 'r-rcpp' 'r-rlang' 'r-stringi' 'r-tibble' 'r-tidyselect>=0.2.5')
optdepends=('r-covr' 'r-gapminder' 'r-knitr' 'r-markdown' 'r-testthat')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('c6ba9a7b19f830eca482b42c3ee2ef43') 

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
