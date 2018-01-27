# Maintainer: Matt Frichtl <frichtlm@gmail.com>
# Contributor: wagnerflo <florian@wagner-flo.net>
_cranname=Rcpp
_cranver=0.12.15
pkgname=r-cran-rcpp
pkgver=${_cranver}
pkgrel=1
pkgdesc="Seamless R and C++ Integration"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL2' 'GPL3')
depends=('r>=3.0.0')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('bebac0782862c15c2944764343e55582')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
