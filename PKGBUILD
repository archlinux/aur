# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-bitops
_cran_name=bitops
_pkgver=1.0-6
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Bitwise Operations"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${_pkgver}.tar.gz")
md5sums=('fba16485a51b1ccd354abde5816b6bdd')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
