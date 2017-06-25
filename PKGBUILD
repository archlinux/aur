# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=dplyr
_cranver=0.7.1
pkgname=r-cran-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="A fast, consistent tool for working with data frame like objects."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r>=3.1.2' 'r-cran-assertthat' 'r-cran-bh' 'r-cran-bindrcpp>=0.2' 'r-cran-glue>=1.1.0' 'r-magrittr' 'r-cran-pkgconfig' 'r-r6' 'r-cran-rlang>=0.1' 'r-cran-rcpp>=0.12.6' 'r-cran-tibble>=1.3.1')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('97fc9b8a8f0dd3a3746260ad885a56c9') 

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
