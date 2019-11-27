# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-rcppparallel
_cran_name=RcppParallel
pkgver=4.4.4
pkgrel=1
pkgdesc="Parallel Programming Tools for 'Rcpp'"
arch=('x86_64')
url="https://CRAN.R-project.org/package=${_cran_name}"
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('44d1379503c68b20f3506af023b7599d')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
