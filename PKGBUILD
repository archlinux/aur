# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-dada2
_bc_name=dada2
pkgver=1.10.1
pkgrel=1
pkgdesc="Accurate, high-resolution sample inference from amplicon sequencing data"
url="https://bioconductor.org/packages/release/bioc/html/${_bc_name}.html"
arch=("x86_64")
license=('Artistic-2.0')
depends=('r' 'r-rcpp' 'r-biostrings' 'r-ggplot2' 'r-datatable' 'r-reshape2' 'r-shortread' 'r-rcppparallel' 'r-iranges' 'r-xvector' 'r-biocgenerics')
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bc_name}_${pkgver}.tar.gz")
sha1sums=('a521e44bf3b08516ef789473b4081e58edb713bc')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_bc_name}
}
