# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-iranges
_bc_name=IRanges
pkgver=2.20.1
pkgrel=1
pkgdesc="Infrastructure for manipulating intervals on sequences"
url="https://bioconductor.org/packages/release/bioc/html/IRanges.html"
arch=("x86_64")
license=('Artistic-2.0')
depends=('r' 'r-utils' 'r-biocgenerics' 'r-s4vectors')
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bc_name}_${pkgver}.tar.gz")
sha1sums=('6cd7971d8e408836c090d87b1ddd94e0aca6a685')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_bc_name}
}
