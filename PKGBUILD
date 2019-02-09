# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-genomeinfodb
_bc_name=GenomeInfoDb
pkgver=1.18.1
pkgrel=1
pkgdesc="Utilities for manipulating chromosome and other 'seqname' identifiers"
url="https://bioconductor.org/packages/release/bioc/html/${_bc_name}.html"
arch=("x86_64")
license=('Artistic-2.0')
depends=('r' 'r-genomeinfodbdata' 'r-iranges' 'r-biocgenerics' 'r-s4vectors' 'r-rcurl')
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bc_name}_${pkgver}.tar.gz")
sha1sums=('f198689ea484eb0dcb353a74d868638635dc4eae')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_bc_name}
}
