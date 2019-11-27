# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-rsamtools
_bc_name=Rsamtools
pkgver=2.2.1
pkgrel=1
pkgdesc="Binary alignment (BAM), FASTA, variant call (BCF), and tabix file import"
url="https://bioconductor.org/packages/release/bioc/html/${_bc_name}.html"
arch=("x86_64")
license=('Artistic-2.0')
depends=('r' 'r-genomeinfodb' 'r-genomicranges' 'r-biocgenerics' 'r-s4vectors' 'r-biostrings' 'r-iranges' 'r-xvector' 'r-zlibbioc' 'r-bitops' 'r-biocparallel' 'r-rhtslib')
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bc_name}_${pkgver}.tar.gz")
sha1sums=('dc30829d270ca77fa29aaffa37b88060c1223320')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_bc_name}
}
