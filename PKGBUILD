# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-s4vectors
_bc_name=S4Vectors
pkgver=0.20.1
pkgrel=1
pkgdesc="S4 implementation of vector-like and list-like objects"
url="https://bioconductor.org/packages/release/bioc/html/${_bc_name}.html"
arch=("x86_64")
license=('Artistic-2.0')
depends=('r' 'r-biocgenerics')
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bc_name}_${pkgver}.tar.gz")
sha1sums=('55d6783b6feb9fe743c07d8b11d226c47fb336d6')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_bc_name}
}
