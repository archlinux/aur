# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-biocparallel
_bc_name=BiocParallel
pkgver=1.20.0
pkgrel=1
pkgdesc="Bioconductor facilities for parallel evaluation"
url="https://bioconductor.org/packages/release/bioc/html/${_bc_name}.html"
arch=("x86_64")
license=('Artistic-2.0')
depends=('r' 'r-snow' 'r-bh' 'r-futilelogger' 'r-utils')
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bc_name}_${pkgver}.tar.gz")
sha1sums=('ab035aff4cb307d0f13639d5e50818499556b737')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_bc_name}
}
