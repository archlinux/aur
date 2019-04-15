# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-colorspace
_cran_name=colorspace
_pkgver=1.4-1
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Toolbox for Manipulating and Assessing Colors and Palettes"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${_pkgver}.tar.gz")
md5sums=('58844479445679a47b5baf227d2a0186')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
