# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-matrix
_cran_name=Matrix
_pkgver=1.2-15
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Sparse and Dense Matrix Classes and Methods"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${_pkgver}.tar.gz")
md5sums=('54e25c04f2d940c60af81aa9491e083d')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
