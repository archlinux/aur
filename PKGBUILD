# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-biostrings
_bc_name=Biostrings
pkgver=2.54.0
pkgrel=1
pkgdesc="Efficient manipulation of biological strings"
url="https://bioconductor.org/packages/release/bioc/html/${_bc_name}.html"
arch=("x86_64")
license=('Artistic-2.0')
depends=('r' 'r-biocgenerics' 'r-s4vectors' 'r-iranges' 'r-xvector')
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bc_name}_${pkgver}.tar.gz")
sha1sums=('77a36598418bcd15a97a789f0fd62d63a00687da')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_bc_name}
}
