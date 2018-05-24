# Maintainer: Alex Branham <branham@utexas.edu>
# Contributor: wagnerflo <florian@wagner-flo.net>
_cranname=zoo
_cranver=1.8-1
pkgname=r-cran-${_cranname}
pkgver=1.8
pkgrel=2
pkgdesc="Methods for totally ordered indexed observations"
url="https://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('x86_64')
license=('GPL3')
depends=('r'
         'r-cran-lattice')
optdepends=('r-cran-coda'
            'r-cran-chron'
            # 'r-cran-DAAG'
            # 'r-cran-fts'
            'r-cran-ggplot2'
            # 'r-cran-mondate'
            'r-cran-scales'
            # 'r-cran-strucchange'
            'r-cran-timeDate'
            # 'r-cran-timeSeries'
            # 'r-cran-tis'
            # 'r-cran-tseries'
            # 'r-cran-xts'
           )
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('bf8789b3a448b5bed39e54e027ee7c6a')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
