# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-xvector
_bc_name=XVector
pkgver=0.22.0
pkgrel=1
pkgdesc="Representation and manipulation of external sequences"
url="https://bioconductor.org/packages/release/bioc/html/BiocGenerics.html"
arch=("x86_64")
license=('Artistic-2.0')
depends=('r' 'r-biocgenerics' 'r-s4vectors' 'r-iranges' 'r-zlibbioc')
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bc_name}_${pkgver}.tar.gz")
sha1sums=('e74aa54ce1e73d10b3bcc0f638ae3a4f182925ce')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_bc_name}
}
