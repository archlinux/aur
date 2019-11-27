# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-xvector
_bc_name=XVector
pkgver=0.26.0
pkgrel=1
pkgdesc="Representation and manipulation of external sequences"
url="https://bioconductor.org/packages/release/bioc/html/XVector.html"
arch=("x86_64")
license=('Artistic-2.0')
depends=('r' 'r-biocgenerics' 'r-s4vectors' 'r-iranges' 'r-zlibbioc')
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bc_name}_${pkgver}.tar.gz")
sha1sums=('3407297a685f182c9fd34fbaa988ffc8e183872e')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_bc_name}
}
