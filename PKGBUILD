# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=dplyr
_cranver=0.7.5
pkgname=r-cran-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="A fast, consistent tool for working with data frame like objects."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r>=3.1.2' 'r-cran-assertthat>=0.2.0' 'r-cran-bindrcpp>=0.2.0.9000' 'r-cran-glue>=1.1.1' 'r-magrittr>=1.5' 'r-cran-pkgconfig>=2.0.1' 'r-r6>=2.2.2' 'r-cran-rcpp>=0.12.15' 'r-cran-rlang>=0.2.0' 'r-cran-tibble>=1.3.1' 'r-cran-tidyselect>=0.2.3')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('f93e79ac92122465a2239fee79ed06b6') 

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
