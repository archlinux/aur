# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-mass
_cran_name=MASS
_pkgver=7.3-51.1
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Support Functions and Datasets for Venables and Ripley's MAS"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${_pkgver}.tar.gz")
md5sums=('99021939fad36a57ecccd79c3abf4156')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
