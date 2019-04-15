# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-stringi
_cran_name=stringi
pkgver=1.4.3
pkgrel=1
pkgdesc="Character String Processing Facilities"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('67a944ae96100e4c8c5fe7a1cca05d60')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
