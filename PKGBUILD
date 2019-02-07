# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-utils
_cran_name=R.utils
pkgver=2.7.0
pkgrel=1
pkgdesc="Various Programming Utilities"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('LGPL3')
depends=('r' 'r-oo')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('81001769efe64a47cde09870d2bfd5b5')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
