# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-biobase
_bc_name=Biobase
pkgver=2.42.0
pkgrel=1
pkgdesc="S4 generic functions needed by many Bioconductor packages."
url="https://bioconductor.org/packages/release/bioc/html/${_bc_name}.html"
arch=("x86_64")
license=('Artistic-2.0')
depends=('r' 'r-biocgenerics')
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bc_name}_${pkgver}.tar.gz")
sha1sums=('747eb3eb144a92efd823734efc72969d6a5c939e')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_bc_name}
}
