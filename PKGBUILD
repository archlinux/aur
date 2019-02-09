# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-viridislite
_cran_name=viridisLite
pkgver=0.3.0
pkgrel=1
pkgdesc="Default Color Maps from 'matplotlib' (Lite Version)"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('3a3fbfd0267589d9b5c12fd9d2eebfc2')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
