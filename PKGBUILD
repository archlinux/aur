# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-oo
_cran_name=R.oo
pkgver=1.22.0
pkgrel=1
pkgdesc="R Object-Oriented Programming with or without References"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('LGPL3')
depends=('r' 'r-methodss3')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('09b2691f2e5c4f46b14c30c198dc56ec')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
