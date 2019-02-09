# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-matrixstats
_cran_name=matrixStats
pkgver=0.54.0
pkgrel=1
pkgdesc="Functions that Apply to Rows and Columns of Matrices (and to Vectors)"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('bb752e0e4a1c8ef78f3ed99e918d1a17')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
