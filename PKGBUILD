# Contributor: Grey Christoforo <first name at last name dot net>
# Based on r-colorspace PKGBUILD
pkgname=r-snow
_cran_name=snow
pkgver=0.4_3
pkgrel=1
pkgdesc="Support for simple parallel computing in R."
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r' 'r-utils')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver//_/-}.tar.gz")
md5sums=('8ea060a12258480ee5ccb33bb522894c')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
