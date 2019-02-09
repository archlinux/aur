# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-crayon
_cran_name=crayon
pkgver=1.3.4
pkgrel=1
pkgdesc="Colored Terminal Output"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('77c7c2906c59a3141306d86c89ffc7d3')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
