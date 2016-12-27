# Maintainer: wagnerflo <florian@wagner-flo.net>
_cranname=colorspace
_cranver=1.3-2
pkgname=r-cran-$_cranname
pkgver=1.3.2
pkgrel=1
pkgdesc="Color Space Manipulation"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('BSD3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('63000bab81d995ff167df76fb97b2984')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
