# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-nlme
_cran_name=nlme
_pkgver=3.1-142
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Linear and Nonlinear Mixed Effects Models"
arch=('x86_64')
url="https://CRAN.R-project.org/package=${_cran_name}"
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${_pkgver}.tar.gz")
md5sums=('5b3a3f0e06492c6b77df4b45046fc64f')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
