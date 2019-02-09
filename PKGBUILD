# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-delayedarray
_bc_name=DelayedArray
pkgver=0.8.0
pkgrel=1
pkgdesc="Delayed operations on array-like objects"
url="https://bioconductor.org/packages/release/bioc/html/${_bc_name}.html"
arch=("x86_64")
license=('Artistic-2.0')
depends=('r' 'r-iranges' 'r-biocgenerics' 'r-s4vectors' 'r-biocparallel' 'r-matirxstats')
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bc_name}_${pkgver}.tar.gz")
sha1sums=('5e1481fdfbc8d4e4966aed238f750c3e01849863')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_bc_name}
}
