# Contributor: Sauliusl <luksaulius at gmail>
# Based on r-colorspace PKGBUILD
pkgname=r-methodss3
pkgver=1.7.0
pkgrel=1
pkgdesc="Methods that simplify the setup of S3 generic functions and S3 methods."
arch=('i686' 'x86_64')
url="http://cran.r-project.org/web/packages/R.methodsS3/index.html"
license=('LGPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/R.methodsS3_${pkgver}.tar.gz")
md5sums=('3198eccdb5b163bf1c4c94410dad71a3')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./R.methodsS3
}
