# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-iranges
_bc_name=IRanges
pkgver=2.16.0
pkgrel=1
pkgdesc="Infrastructure for manipulating intervals on sequences"
url="https://bioconductor.org/packages/release/bioc/html/IRanges.html"
arch=("x86_64")
license=('Artistic-2.0')
depends=('r' 'r-utils' 'r-biocgenerics' 'r-s4vectors')
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bc_name}_${pkgver}.tar.gz")
sha1sums=('69864216912bf9109202777d37f6e1bee5940196')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_bc_name}
}
