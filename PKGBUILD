# Maintainer: Matt Frichtl <frichtlm@gmail.com>
_cranname=Rcpp
_cranver=0.12.17
pkgname=r-rcpp
pkgver=${_cranver}
pkgrel=1
pkgdesc="Seamless R and C++ Integration"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL-2' 'GPL-3')
depends=('r>=3.0.0')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('eee1ece3b0a246c4a21e2e1e23213a8a')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
