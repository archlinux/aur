# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-stringr
_cran_name=stringr
pkgver=1.3.1
pkgrel=1
pkgdesc="Simple, Consistent Wrappers for Common String Operations"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r' 'r-glue' 'r-magrittr' 'r-stringi')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('2b52caf5b5873afaf5e5a48a6513805f')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
