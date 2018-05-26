# Originator: wagnerflo <florian@wagner-flo.net>
# Maintainer: Matt Frichtl <frichtlm@gmail.com>
_cranname=plyr
_cranver=1.8.4
pkgname=r-cran-$_cranname
pkgver=${_cranver}
pkgrel=2
pkgdesc="Tools for Splitting, Applying and Combining Data"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r>=3.1.0' 'r-cran-rcpp>=0.11.0')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('ef455cf7fc06e34837692156b7b2587b')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
