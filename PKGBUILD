# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-r.utils
_cran_name=R.utils
pkgver=2.9.2
pkgrel=1
pkgdesc="Various Programming Utilities"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('LGPL3')
depends=('r' 'r-oo')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('8629f732956b4f040429f2dccc533168')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
