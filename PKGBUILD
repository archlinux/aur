# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-r6
_cran_name=R6
pkgver=2.4.0
pkgrel=1
pkgdesc="Create Compact Hash Digests of R Objects"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('f8e4f293f95efd44b5a2a77f4446318e')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
