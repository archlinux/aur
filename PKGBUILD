# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-labeling
_cran_name=labeling
pkgver=0.3
pkgrel=1
pkgdesc="Axis Labeling"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('ccd7082ec0b211aba8a89d85176bb534')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
