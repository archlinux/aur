# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-assertthat
_cran_name=assertthat
pkgver=0.2.0
pkgrel=1
pkgdesc="Easy Pre and Post Assertions"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('8134f0072c6a84fd738d3bfc5e7f68ef')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
