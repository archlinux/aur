# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-oo
_cran_name=R.oo
pkgver=1.23.0
pkgrel=1
pkgdesc="R Object-Oriented Programming with or without References"
arch=('x86_64')
url="https://CRAN.R-project.org/package=R.${_cran_name}"
license=('LGPL3')
depends=('r' 'r-methodss3')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('1607ded50e667083e1a435ac527bdbde')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
