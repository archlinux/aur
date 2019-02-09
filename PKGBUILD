# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-colorspace
_cran_name=colorspace
_pkgver=1.4-0
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Toolbox for Manipulating and Assessing Colors and Palettes"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${_pkgver}.tar.gz")
md5sums=('121120c1686dddd41f7fe4c176565216')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
