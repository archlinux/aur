# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-matrixstats
_cran_name=matrixStats
pkgver=0.55.0
pkgrel=1
pkgdesc="Functions that Apply to Rows and Columns of Matrices (and to Vectors)"
arch=('x86_64')
url="https://CRAN.R-project.org/package=${_cran_name}"
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('860aa7af56ddb598268cbca7921e2d4c')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
