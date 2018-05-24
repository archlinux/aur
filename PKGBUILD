# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=tidyr
_cranver=0.8.1
pkgname=r-cran-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="An evolution of 'reshape2'. It's designed specifically for data tidying (not general reshaping or aggregating) and works well with 'dplyr' data pipelines."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r>=3.1.0' 'r-cran-dplyr>=0.7.0' 'r-cran-glue' 'r-magrittr' 'r-cran-purrr' 'r-cran-rcpp' 'r-cran-rlang' 'r-cran-tibble' 'r-stringi' 'r-cran-tidyselect')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('e4381bbea1da63280afa244df3f85940') 

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
