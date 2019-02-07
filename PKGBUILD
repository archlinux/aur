# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-biocgenerics
_bc_name=BiocGenerics
pkgver=0.28.0
pkgrel=1
pkgdesc="S4 generic functions needed by many Bioconductor packages."
url="https://bioconductor.org/packages/release/bioc/html/BiocGenerics.html"
arch=("x86_64")
license=('Artistic-2.0')
depends=('r' 'r-utils')
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bc_name}_${pkgver}.tar.gz")
sha1sums=('3af3313dbc08cfbe94f70fdd0313bc45236e20da')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_bc_name}
}
