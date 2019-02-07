# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-methodss3
_cran_name=R.methodsS3
pkgver=1.7.1
pkgrel=1
pkgdesc="Methods that simplify the setup of S3 generic functions and S3 methods."
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('LGPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('c88e815837f268affd4f2a39c737d969')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
