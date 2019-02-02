# Maintainer: frichtlm <frichtlm@gmail.com>
# Contributor: wagnerflo <florian@wagner-flo.net>
_cranname=tibble
_cranver=2.0.1
pkgname=r-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="Provides a 'tbl_df' class (the 'tibble') that provides stricter checking and better formatting than the traditional data frame."
url="https://CRAN.R-project.org/package=tibble"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r>=3.1.0' 'r-crayon>=1.3.4' 'r-fansi>=0.4.0' 'r-pillar>=1.3.1' 'r-pkgconfig>=2.0.2' 'r-rlang>=0.3.1')
optdepends=('r-bench' 'r-covr' 'r-dplyr' 'r-htmltools' 'r-import' 'r-knitr' 'r-mockr' 'r-nycflights13' 'r-rmarkdown' 'r-testhat' 'r-withr')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('1c00f14fa05507df47de4e38263d2773')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
