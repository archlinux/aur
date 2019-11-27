# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-formatr
_cran_name=formatR
pkgver=1.7
pkgrel=1
pkgdesc="Format R Code Automatically"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('1b223bdb396ef14597e8a449c53af2fb')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
