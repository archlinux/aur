# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-genomeinfodb
_bc_name=GenomeInfoDb
pkgver=1.18.2
pkgrel=1
pkgdesc="Utilities for manipulating chromosome and other 'seqname' identifiers"
url="https://bioconductor.org/packages/release/bioc/html/${_bc_name}.html"
arch=("x86_64")
license=('Artistic-2.0')
depends=('r' 'r-genomeinfodbdata' 'r-iranges' 'r-biocgenerics' 'r-s4vectors' 'r-rcurl')
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bc_name}_${pkgver}.tar.gz")
sha1sums=('011ce8d8f8927d613567f9fd2722efafb2d766d4')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_bc_name}
}
