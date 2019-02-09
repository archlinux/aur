# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-scales-fix
_cran_name=scales
pkgver=1.0.0
pkgrel=1
pkgdesc="Scale Functions for Visualization"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
provides=("r-scales=${pkgver}")
conflicts=('r-scales')
depends=('r' 'r-labeling' 'r-munsell' 'r-r6' 'r-rcpp' 'r-rcolorbrewer' 'r-viridislite')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${pkgver}.tar.gz")
md5sums=('89eec6d9e176fefb7f26655e1b0aa701')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
