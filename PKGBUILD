_cranname=chron
_cranver=2.3-53
pkgname=r-$_cranname
pkgver=2.3.53
pkgrel=3
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
md5sums=('7e5d7d7de3bc988f58fd2e8314ae88dc')
