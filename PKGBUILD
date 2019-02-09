# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-fansi
_cran_name=fansi
pkgver=0.4.0
pkgrel=1
pkgdesc="ANSI Control Sequence Aware String Functions"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('8642a7132e7c2f64ce60a67f2c05304b')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
