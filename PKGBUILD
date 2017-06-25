# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=tidyr
_cranver=0.6.3
pkgname=r-cran-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="Functions to easily tidy data."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r>=3.1.0' 'r-cran-dplyr>=0.4' 'r-cran-lazyeval' 'r-cran-rcpp' 'r-cran-tibble' 'r-magrittr' 'r-stringi')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('48e1bef9b0af15bed3a09c255ab4e4b5') 

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
