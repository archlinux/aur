# Maintainer: frichtlm <frichtlm@gmail.com>
# Contributor: wagnerflo <florian@wagner-flo.net>
_cranname=ggplot2
_cranver=3.0.0
pkgname=r-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="Create Elegant Data Visualisations Using the Grammar of Graphics"
url="https://cran.r-project.org/package=ggplot2"
arch=('i686' 'x86_64')
license=('GPL-2')
depends=('r>=3.1' 'r-digest' 'r-gtable>=0.1.1' 'r-lazyeval' 'r-plyr>=1.7.1' 'r-reshape2' 'r-scales>=0.5.0' 'r-tibble' 'r-viridislite' 'r-withr>=2.0.0')
optdepends=('r-covr' 'r-dplyr' 'r-ggplot2movies' 'r-hexbin' 'r-hmisc' 'r-mapproj' 'r-maps' 'r-maptools' 'r-multcomp' 'r-munsell' 'r-testthat' 'r-vdiffr' 'r-quantreg' 'r-knitr' 'r-rgeos' 'r-rpart' 'r-rmarkdown' 'r-svglite')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('95622cd0933f66865dc5e3a46f6fe18b')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
