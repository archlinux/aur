# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-lambdar
_cran_name=lambda.r
pkgver=1.2.3
pkgrel=1
pkgdesc="Modeling Data with Functional Programming"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r' 'r-formatr')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('662f16f71a65366e0492d43ad1523db7')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
