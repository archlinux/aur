# Contributor: Sauliusl <luksaulius at gmail>
# Based on r-colorspace PKGBUILD
pkgname=r-snow
pkgver=0.3_13
pkgrel=1
pkgdesc="Support for simple parallel computing in R."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/snow/index.html"
license=('GPL3')
depends=('r' 'r-utils')
source=("http://cran.r-project.org/src/contrib/snow_${pkgver//_/-}.tar.gz")
md5sums=('c790384d817d050aed5cff19fb2b7473')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./snow
}
