# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-futilelogger
_cran_name=futile.logger
pkgver=1.4.3
pkgrel=1
pkgdesc="A Logging Utility for R"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r' 'r-lambdar' 'r-futileoptions')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('ba0e8d2dfb5a970b51c21907bbf8bfc2')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
