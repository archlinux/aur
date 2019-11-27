# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-dada2
_bc_name=dada2
pkgver=1.14.0
pkgrel=1
pkgdesc="Accurate, high-resolution sample inference from amplicon sequencing data"
url="https://bioconductor.org/packages/release/bioc/html/${_bc_name}.html"
arch=("x86_64")
license=('Artistic-2.0')
depends=('r' 'r-rcpp' 'r-biostrings' 'r-ggplot2' 'r-datatable' 'r-reshape2' 'r-shortread' 'r-rcppparallel' 'r-iranges' 'r-xvector' 'r-biocgenerics')
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bc_name}_${pkgver}.tar.gz")
sha1sums=('a9a5e7b9ea1fa19a0570e30ef073da21a81a06ec')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_bc_name}
}
