# Maintainer: wagnerflo <florian@wagner-flo.net>
_cranname=assertthat
_cranver=0.1
pkgname=r-cran-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="Easy pre and post assertions"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('59f9d7f7c00077ea54d763b78eeb5798')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
