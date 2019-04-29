# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=readr
_cranver=1.3.1
pkgname=r-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="Improved methods for reading rectangular data."
url="https://cran.r-project.org/package=${_cranname}"
arch=('i686' 'x86_64')
license=('GPL-2' 'GPL-3')
depends=('r>=3.1' 'r-rcpp>=0.12.0.5' 'r-tibble' 'r-hms>=0.4.1' 'r-r6' 'r-clipr' 'r-crayon' 'r-bh')
optdepends=('r-curl' 'r-testthat' 'r-knitr' 'r-rmarkdown' 'r-stringi' 'r-covr' 'r-spelling')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('b41b0e9251c19b1c54c032e1f55be9d0') 

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
