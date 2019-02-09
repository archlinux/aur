# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-rcppparallel
_cran_name=RcppParallel
pkgver=4.4.2
pkgrel=1
pkgdesc="Parallel Programming Tools for 'Rcpp'"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('7b327a8497cde8df49e85745fe66e5f8')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
