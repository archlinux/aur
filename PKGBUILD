_cranname=animation
pkgname=r-$_cranname
pkgver=2.5
pkgrel=2
pkgdesc="Provides functions for animations in statistics"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('any')
depends=('r')
license=('GPL3')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${pkgver}.tar.gz")
md5sums=('80ce6a5bddc99b44add704398eff304b')
 
package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
