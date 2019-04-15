# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-utils
_cran_name=R.utils
pkgver=2.8.0
pkgrel=1
pkgdesc="Various Programming Utilities"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('LGPL3')
depends=('r' 'r-oo')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('56bbdf8bca68b9e61aa868819aeed7b2')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
