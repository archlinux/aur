# Maintainer: frichtlm <frichtlm@gmail.com>
# Contributor: wagnerflo <florian@wagner-flo.net>
_cranname=ggplot2
_cranver=2.2.1
pkgname=r-cran-$_cranname
pkgver=${_cranver}
pkgrel=3
pkgdesc="Create Elegant Data Visualisations Using the Grammar of Graphics"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('r' 'r-digest' 'r-gtable>=0.1.1' 'r-cran-plyr>=1.7.1' 'r-cran-reshape2' 'r-cran-scales>=0.4.1' 'r-cran-tibble' 'r-cran-lazyeval')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('14c5a3507bc123c6e7e9ad3bef7cee5c')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
