# Maintainer: frichtlm <frichtlm@gmail.com>
# Contribitor: wagnerflo <florian@wagner-flo.net>
_cranname=reshape2
_cranver=1.4.3
pkgname=r-cran-$_cranname
pkgver=${_cranver}
pkgrel=2
pkgdesc="Flexibly Reshape Data: A Reboot of the Reshape Package"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r>=3.1' 'r-cran-plyr>=1.8.1' 'r-cran-rcpp' 'r-stringr')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('8f35f5a2b7d4f081e9825f1095133288')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
