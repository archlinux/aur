# Maintainer: frichtlm <frichtlm@gmail.com>
# Contribitor: wagnerflo <florian@wagner-flo.net>
_cranname=reshape2
_cranver=1.4.2
pkgname=r-cran-$_cranname
pkgver=${_cranver}
pkgrel=2
pkgdesc="Flexibly Reshape Data: A Reboot of the Reshape Package"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r' 'r-cran-plyr>=1.8.1' 'r-stringr' 'r-cran-rcpp')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('c851a0312191b8c5bab956445df7cf5f')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
