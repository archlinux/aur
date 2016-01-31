_cranname=chron
_cranver=2.3-47
pkgname=r-cran-$_cranname
pkgver=2.3.47
pkgrel=1
pkgdesc="Chronological objects which can handle dates and times."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('any')
depends=('r')
license=('LGPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('b8890cdc5f2337f8fd775b0becdcdd1f')
 
package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
