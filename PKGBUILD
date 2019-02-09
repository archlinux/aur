# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-magrittr
_cran_name=magrittr
pkgver=1.5
pkgrel=1
pkgdesc="A Forward-Pipe Operator for R"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('e74ab7329f2b9833f0c3c1216f86d65a')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
