# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-pillar
_cran_name=pillar
pkgver=1.4.2
pkgrel=1
pkgdesc="Coloured Formatting for Columns"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r' 'r-cli' 'r-crayon' 'r-fansi' 'r-rlang' 'r-utf8' 'r-vctrs')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('0685272b193615c8fcd56cd53cda3898')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
