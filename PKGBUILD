# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-biobase
_bc_name=Biobase
pkgver=2.46.0
pkgrel=1
pkgdesc="Functions that are needed by many other packages or which replace R functions."
url="https://bioconductor.org/packages/release/bioc/html/${_bc_name}.html"
arch=("x86_64")
license=('Artistic-2.0')
depends=('r' 'r-biocgenerics' 'r-utils')
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bc_name}_${pkgver}.tar.gz")
sha1sums=('4dcd9a29ce30fb8ca2d3d62f721e9c88853245ae')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_bc_name}
}
