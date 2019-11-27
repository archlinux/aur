# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-lambdar
_cran_name=lambda.r
pkgver=1.2.4
pkgrel=1
pkgdesc="Modeling Data with Functional Programming"
arch=('x86_64')
url="https://CRAN.R-project.org/package=${_cran_name}"
license=('GPL3')
depends=('r' 'r-formatr')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('861157dc2fe66ce8ed1e755578a57e47')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
