_cranname=animation
pkgname=r-$_cranname
pkgver=2.6
pkgrel=1
pkgdesc="Provides functions for animations in statistics"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('any')
depends=('r-magick')
license=('GPL3')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${pkgver}.tar.gz")
md5sums=('8f134dc582376d6e0bd47690a001d2b5')
 
package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
