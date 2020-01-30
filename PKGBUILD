# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-stringi
_cran_name=stringi
pkgver=1.4.5
pkgrel=1
pkgdesc="Character String Processing Facilities"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('83434d4f28361417b653fae33ba721e5')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
