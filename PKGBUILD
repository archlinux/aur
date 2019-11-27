# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-summarizedexperiment
_bc_name=SummarizedExperiment
pkgver=1.16.0
pkgrel=1
pkgdesc="SummarizedExperiment container"
url="https://bioconductor.org/packages/release/bioc/html/${_bc_name}.html"
arch=("x86_64")
license=('Artistic-2.0')
depends=('r' 'r-genomeinfodb' 'r-iranges' 'r-biocgenerics' 'r-s4vectors' 'r-genomicranges' 'r-biobase' 'r-delayedarray')
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bc_name}_${pkgver}.tar.gz")
sha1sums=('a56b0817ad6a3c182c0da68a5b6f5433907a24a3')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_bc_name}
}
