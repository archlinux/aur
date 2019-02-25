# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=purrr
_cranver=0.3.0
pkgname=r-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="A complete and consistent functional programming toolkit for R."
url="https://cran.r-project.org/package=purrr"
arch=('i686' 'x86_64')
license=('GPL-3')
depends=('r>=3.1' 'r-magrittr>=1.5' 'r-rlang>=0.3.1')
optdepends=('r-covr' 'r-crayon' 'r-dplyr' 'r-knitr' 'r-markdown' 'r-testthat' 'r-tibble' 'r-tidyselect')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('c7470a122ccd7f45dae5da547b7bf2e7') 

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
