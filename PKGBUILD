# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-backports
_cran_name=backports
pkgver=1.1.4
pkgrel=1
pkgdesc="Reimplementations of Functions Introduced Since R-3.0.0"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r' 'r-utils')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('0271f2897b4778c4f3a4c655da098257')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
