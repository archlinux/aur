# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-lattice
_cran_name=lattice
_pkgver=0.20-38
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Trellis Graphics for R"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${_pkgver}.tar.gz")
md5sums=('f80724e04f6a18640aea0f18ef2626a9')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
