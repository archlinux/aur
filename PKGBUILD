# Maintainer: wagnerflo <florian@wagner-flo.net>
_cranname=stringr
_cranver=1.1.0
pkgname=r-cran-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="Consistent, simple and easy to use wrappers around the stringi package"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('r' 'r-cran-stringi>=0.4.1' 'r-cran-magrittr')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('47973a33944c6d5db9524b1e835b8a5d')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
