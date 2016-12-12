# Maintainer: wagnerflo <florian@wagner-flo.net>
_cranname=scales
_cranver=0.4.1
pkgname=r-cran-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="Tools for Splitting, Applying and Combining Data"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r' 'r-cran-rcolorbrewer' 'r-cran-dichromat' 'r-cran-plyr'
             'r-cran-munsell' 'r-cran-labeling' 'r-cran-rcpp')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('3fb2218866a7fe4c1f6e66790876f85a')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
