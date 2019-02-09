# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-datatable
_cran_name=data.table
pkgver=1.12.0
pkgrel=1
pkgdesc="Extension of 'data.frame'"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('8ee67a2a2cafebad34c6bbdb8770a189')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
