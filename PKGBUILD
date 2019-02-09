# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-munsell
_cran_name=munsell
pkgver=0.5.0
pkgrel=1
pkgdesc="Utilities for Using Munsell Colours"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r' 'r-colorspace')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('b287f380a958399cfa12f665232e7f34')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
