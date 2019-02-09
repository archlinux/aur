# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-latticeextra
_cran_name=latticeExtra
_pkgver=0.6-28
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Extra Graphical Utilities Based on Lattice"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${_pkgver}.tar.gz")
md5sums=('771938f25d0983763369b48a1153b26c')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
