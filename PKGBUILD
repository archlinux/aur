_cranname=data.table
pkgname=r-cran-$_cranname
pkgver=1.10.4
pkgrel=1
pkgdesc="Fast aggregation of large data (e.g. 100GB in RAM), fast ordered joins, fast add/modify/delete of columns by group using no copies at all, list columns and a fast file reader (fread). Offers a natural and flexible syntax, for faster development."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('x86_64')
depends=('r-cran-chron')
license=('LGPL3')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${pkgver}.tar.gz")
md5sums=('5cf2286158d960fa885faf022c49bbbe')
 
package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
