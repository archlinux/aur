# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-utf8
_cran_name=utf8
pkgver=1.1.4
pkgrel=1
pkgdesc="Unicode Text Processing"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('33de0b2841c49e84f8eb5a7b2a8222b8')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
