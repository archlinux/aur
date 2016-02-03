_cranname=animation
pkgname=r-cran-$_cranname
pkgver=2.4
pkgrel=2
pkgdesc="Provides functions for animations in statistics"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('any')
depends=('r')
license=('LGPL3')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${pkgver}.tar.gz")
md5sums=('619aebb7cad045e3dd694b32ffa5b4f4')
 
package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
