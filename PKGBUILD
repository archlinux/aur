_cranname=chron
_cranver=2.3-54
pkgname=r-$_cranname
pkgver=2.3.54
pkgrel=1
pkgdesc="Chronological objects which can handle dates and times."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('x86_64')
depends=('r')
license=('GPL2')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
 
package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
md5sums=('896064867fcf32f40f21f7317217f420')
