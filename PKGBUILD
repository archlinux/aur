# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-zeallot
_cran_name=zeallot
pkgver=0.1.0
pkgrel=1
pkgdesc="Multiple, Unpacking, and Destructuring Assignment"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('5de529556de3154caf069ce3ee39329d')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
