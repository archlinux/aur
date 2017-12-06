# Maintainer: Matt Frichtl <frichtlm@gmail.com>
# Contributor: wagnerflo <florian@wagner-flo.net>
_cranname=Rcpp
_cranver=0.12.14
pkgname=r-cran-rcpp
pkgver=${_cranver}
pkgrel=1
pkgdesc="Seamless R and C++ Integration"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL2' 'GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('89a3dbad0aa3e345b9d0b862fa1fc56a')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
