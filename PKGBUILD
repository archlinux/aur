# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-withr
_cran_name=withr
pkgver=2.1.2
pkgrel=1
pkgdesc="Run Code 'With' Temporarily Modified Global State"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('85e8574fb0a6832c4f275531be6371d6')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
