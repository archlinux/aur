_cranname=data.table
_cranver=1.11.8
pkgname=r-$_cranname
pkgver=1.11.8
pkgrel=1
pkgdesc="Fast aggregation of large data (e.g. 100GB in RAM), fast ordered joins, fast add/modify/delete of columns by group using no copies at all, list columns and a fast file reader (fread). Offers a natural and flexible syntax, for faster development."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('x86_64')
depends=('r-chron')
license=('MPL2')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('f39c262cc8ef605783423a6b06fba82c')
 
package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
