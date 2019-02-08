# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-nlme
_cran_name=nlme
_pkgver=3.1-137
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Linear and Nonlinear Mixed Effects Models"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${_pkgver}.tar.gz")
md5sums=('1a9f73fd036e2406d430008ccf96048b')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
