# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-delayedarray
_bc_name=DelayedArray
pkgver=0.12.0
pkgrel=1
pkgdesc="Delayed operations on array-like objects"
url="https://bioconductor.org/packages/release/bioc/html/${_bc_name}.html"
arch=("x86_64")
license=('Artistic-2.0')
depends=('r' 'r-iranges' 'r-biocgenerics' 'r-s4vectors' 'r-biocparallel' 'r-matrixstats')
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bc_name}_${pkgver}.tar.gz")
sha1sums=('53a087be70db65f2775f319b8d71e4489e0a52cf')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_bc_name}
}
