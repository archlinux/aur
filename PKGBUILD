# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=dplyr
_cranver=0.8.3
pkgname=r-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="A fast, consistent tool for working with data frame like objects."
url="https://cran.r-project.org/package=${_cranname}"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r>=3.2.0' 'r-assertthat>=0.2.0' 'r-glue>=1.3.0' 'r-magrittr>=1.5' 'r-pkgconfig' 'r-r6' 'r-rcpp>=1.0.1' 'r-rlang>=0.4.0' 'r-tibble>=2.0.0' 'r-tidyselect>=0.2.5')
optdepends=('r-bit64' 'r-callr' 'r-covr' 'r-crayon' 'r-dbi' 'r-dbplyr' 'r-dtplyr' 'r-ggplot2' 'r-hms' 'r-knitr' 'r-lahman' 'r-lubridate' 'r-mgcv' 'r-microbenchmark' 'r-nycflights13' 'r-rmarkdown' 'r-rmysql' 'r-rpostgresql' 'r-rsqlite' 'r-testthat' 'r-withr' 'r-broom' 'r-purrr' 'r-readr')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('7a2136d96451fa991beca82facfd63be') 

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
