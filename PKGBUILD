# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-genomicranges
_bc_name=GenomicRanges
pkgver=1.34.0
pkgrel=1
pkgdesc="Representation and manipulation of genomic intervals and variables defined along a genome"
url="https://bioconductor.org/packages/release/bioc/html/${_bc_name}.html"
arch=("x86_64")
license=('Artistic-2.0')
depends=('r' 'r-biocgenerics' 'r-s4vectors' 'r-iranges' 'r-genomeinfodb')
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bc_name}_${pkgver}.tar.gz")
sha1sums=('8c5b4e1bbaa6908145514e3ef2c725789a43395d')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_bc_name}
}
