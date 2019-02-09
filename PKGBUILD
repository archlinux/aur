# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-pillar
_cran_name=pillar
pkgver=1.3.1
pkgrel=1
pkgdesc="Coloured Formatting for Columns"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r' 'r-cli' 'r-crayon' 'r-fansi' 'r-rlang' 'r-utf8')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('fe7ef47df16a5599b20121de28923c32')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
