# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-r6
_cran_name=R6
pkgver=2.4.1
pkgrel=1
pkgdesc="Create Compact Hash Digests of R Objects"
arch=('x86_64')
url="https://CRAN.R-project.org/package=${_cran_name}"
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('78cabfb5a4e18fab29659752271ab4af')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
