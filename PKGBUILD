_cranname=chron
_cranver=2.3-52
pkgname=r-cran-$_cranname
pkgver=2.3.52
pkgrel=2
pkgdesc="Chronological objects which can handle dates and times."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('x86_64')
depends=('r')
license=('LGPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('e0f1edf9a081e7b29216b439280dbd29')
 
package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
