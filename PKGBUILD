# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-rcurl
_cran_name=RCurl
_pkgver=1.95-4.12
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="General Network (HTTP/FTP/...) Client Interface for R"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r' 'r-bitops')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${_pkgver}.tar.gz")
sha512sums=('8c0aeda47c1d6210c5c431e1209e192f2b48653850aa2f6f8b5bf099196cf6a89a61e8638d3b21e3a84312f427a9419d607f4198500aa2b7fd8238e24e6e599c')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
