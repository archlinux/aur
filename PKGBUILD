# Contributor: Sauliusl <luksaulius at gmail>
# Based on r-colorspace PKGBUILD
pkgname=r-utils
pkgver=2.0.0
pkgrel=1
pkgdesc="Utility functions useful when programming and developing R packages."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/R.utils/index.html"
license=('LGPL3')
depends=('r' 'r-oo')
source=("http://cran.r-project.org/src/contrib/R.utils_${pkgver}.tar.gz")
md5sums=('ff1640f681980e8c0cb3de93c942e2cf')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./R.utils
}
