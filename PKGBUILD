# Contributor: Sauliusl <luksaulius at gmail>
# Based on r-colorspace PKGBUILD
pkgname=r-catools
pkgver=1.17.1
pkgrel=1
pkgdesc="Moving (rolling, running) window statistic functions, read/write for GIF and ENVI binary files, fast calculation of AUC, LogitBoost classifier, base64 encoder/decoder, round-off-error-free sum and cumsum, etc."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/caTools/index.html"
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/caTools_${pkgver}.tar.gz")
md5sums=('5c872bbc78b177b306f36709deb44498')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./caTools
}
