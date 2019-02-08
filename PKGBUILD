# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-gtable
_cran_name=gtable
pkgver=0.2.0
pkgrel=1
pkgdesc="Arrange 'Grobs' in Tables"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('124090ae40b2dd3170ae11180e0d4cab')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
