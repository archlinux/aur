# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-s4vectors
_bc_name=S4Vectors
pkgver=0.24.0
pkgrel=1
pkgdesc="S4 implementation of vector-like and list-like objects"
url="https://bioconductor.org/packages/release/bioc/html/${_bc_name}.html"
arch=("x86_64")
license=('Artistic-2.0')
depends=('r' 'r-biocgenerics')
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bc_name}_${pkgver}.tar.gz")
sha1sums=('9e96c9ff857ae4243d346b66e9281404dc3292c1')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_bc_name}
}
