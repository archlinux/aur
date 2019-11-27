# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-genomicalignments
_bc_name=GenomicAlignments
pkgver=1.22.1
pkgrel=1
pkgdesc="Representation and manipulation of short genomic alignments"
url="https://bioconductor.org/packages/release/bioc/html/${_bc_name}.html"
arch=("x86_64")
license=('Artistic-2.0')
depends=('r' 'r-genomeinfodb' 'r-iranges' 'r-biocgenerics' 'r-s4vectors' 'r-rcurl' 'r-genomicranges' 'r-summarizedexperiment' 'r-biostrings' 'r-rsamtools' 'r-biocparallel')
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bc_name}_${pkgver}.tar.gz")
sha1sums=('03ae50b0e10b737f41f80cec5727aafdb6bcad1b')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_bc_name}
}
