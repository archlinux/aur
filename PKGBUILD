# Maintainer: wagnerflo <florian@wagner-flo.net>
_cranname=digest
_cranver=0.6.10
pkgname=r-cran-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="hash digests of arbitrary R objects"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('47d19499e89d3bd3e2c2c20ff3f33001')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
