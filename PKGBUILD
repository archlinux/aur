# Maintainer: wagnerflo <florian@wagner-flo.net>
_cranname=proto
_cranver=1.0.0
pkgname=r-cran-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="prototype-based object system"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('ba74c21febd5282d73e97ccaf5ebbb84')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
