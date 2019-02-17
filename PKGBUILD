# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-biocparallel
_bc_name=BiocParallel
pkgver=1.16.6
pkgrel=1
pkgdesc="Bioconductor facilities for parallel evaluation"
url="https://bioconductor.org/packages/release/bioc/html/${_bc_name}.html"
arch=("x86_64")
license=('Artistic-2.0')
depends=('r' 'r-snow' 'r-bh' 'r-futilelogger' 'r-utils')
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bc_name}_${pkgver}.tar.gz")
sha1sums=('81c01c7518b35c711a9d9cdf5ac7a09c355feaa4')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_bc_name}
}
