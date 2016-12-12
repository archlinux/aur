# Maintainer: wagnerflo <florian@wagner-flo.net>
_cranname=dichromat
_cranver=2.0-0
pkgname=r-cran-$_cranname
pkgver=2.0.0
pkgrel=1
pkgdesc="Color Schemes for Dichromats"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('84e194ac95a69763d740947a7ee346a6')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
