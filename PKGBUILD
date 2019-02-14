# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=dplyr
_cranver=0.7.8
pkgname=r-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="A fast, consistent tool for working with data frame like objects."
url="https://cran.r-project.org/package=${_cranname}"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r>=3.1.2' 'r-assertthat>=0.2.0' 'r-bindrcpp>=0.2.0.9000' 'r-glue>=1.1.1' 'r-magrittr>=1.5' 'r-pkgconfig>=2.0.1' 'r-r6>=2.2.2' 'r-rcpp>=0.12.19' 'r-rlang>=0.3.0' 'r-tibble>=1.4.2' 'r-tidyselect>=0.2.3' 'r-bh>=1.58.0_1' 'r-plogr>=0.1.10')
optdepends=('r-bit64' 'r-callr' 'r-covr' 'r-dbi' 'r-dbplyr' 'r-dtplyr' 'r-ggplot2' 'r-hms' 'r-knitr' 'r-lahman' 'r-lubridate' 'r-mgcv' 'r-microbenchmark' 'r-nycflights13' 'r-rmarkdown' 'r-rmysql' 'r-rpostgresql' 'r-rsqlite' 'r-testthat' 'r-withr')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('981a0037c71f6947590e7d578ba80e7a') 

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
