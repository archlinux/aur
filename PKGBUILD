# Contributor: Sauliusl <luksaulius at gmail>
# Based on r-colorspace PKGBUILD
pkgname=r-oo
pkgver=1.19.0
pkgrel=1
pkgdesc="Methods and classes for object-oriented programming in R with or without references."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/R.oo/index.html"
license=('LGPL3')
depends=('r' 'r-methodss3')
source=("http://cran.r-project.org/src/contrib/R.oo_${pkgver}.tar.gz")
md5sums=('5de25f313aa36903061db266ae74cc7c')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./R.oo
}
