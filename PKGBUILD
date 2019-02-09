# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-rcurl
_cran_name=RCurl
_pkgver=1.95-4.11
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="General Network (HTTP/FTP/...) Client Interface for R"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r' 'r-bitops')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${_pkgver}.tar.gz")
md5sums=('6218087742f61ab2dfbbe4b18ac248a0')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
