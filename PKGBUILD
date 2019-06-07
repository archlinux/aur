# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-vctrs
_cran_name=vctrs
pkgver=0.1.0
pkgrel=1
pkgdesc="Vector Helpers"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r' 'r-backports' 'r-digest' 'r-glue' 'r-rlang' 'r-zeallot')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('e0ea02aefda2a7a4712a2e578f238f72')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
