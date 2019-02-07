# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-futileoptions
_cran_name=futile.options
pkgver=1.0.1
pkgrel=1
pkgdesc="Futile Options Management"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('040daac5089839c104ffd0e0fbedb98d')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
