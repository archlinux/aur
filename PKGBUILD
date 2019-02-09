# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-hwriter
_cran_name=hwriter
pkgver=1.3.2
pkgrel=1
pkgdesc="HTML Writer - Outputs R objects in HTML format"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('9eef49df2eb68bbf3a16b5860d933517')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
