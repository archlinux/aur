_cranname=data.table
_cranver=1.12.2
pkgname=r-$_cranname
pkgver=1.12.2
pkgrel=1
pkgdesc="Fast aggregation of large data (e.g. 100GB in RAM), fast ordered joins, fast add/modify/delete of columns by group using no copies at all, list columns and a fast file reader (fread). Offers a natural and flexible syntax, for faster development."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('x86_64')
depends=('r-chron')
license=('MPL2')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
 
package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
md5sums=('93b8f74d38a0819c881576de5883d5cb')
