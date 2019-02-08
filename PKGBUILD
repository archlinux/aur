# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-mgcv
_cran_name=mgcv
_pkgver=1.8-27
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Mixed GAM Computation Vehicle with Automatic Smoothness Estimation"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${_pkgver}.tar.gz")
md5sums=('a8bba0e97a19315a2f74c69f003bb02d')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
