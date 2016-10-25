# Maintainer: wagnerflo <florian@wagner-flo.net>
_cranname=zoo
_cranver=1.7-13
pkgname=r-cran-$_cranname
pkgver=1.7.13
pkgrel=1
pkgdesc="Methods for totally ordered indexed observations"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('99521dfa4c668e692720cefcc5a1bf30')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
