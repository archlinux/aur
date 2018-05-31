# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=readr
_cranver=1.1.1
pkgname=r-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="Improved methods for reading rectangular data."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL-2' 'GPL-3')
depends=('r>=3.0.2' 'r-rcpp>=0.12.0.5' 'r-tibble' 'r-hms' 'r-r6')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('cffb6669664f6a0f6fe172542e64cb47') 

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
