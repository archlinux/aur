# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-genomeinfodbdata
_bc_name=GenomeInfoDbData
pkgver=1.2.2
pkgrel=1
pkgdesc="Species and taxonomy ID look up tables used by GenomeInfoDb"
url="https://bioconductor.org/packages/release/data/annotation/html/${_bc_name}.html"
arch=("x86_64")
license=('Artistic-2.0')
depends=('r')
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_bc_name}_${pkgver}.tar.gz")
sha1sums=('8bb1009e90ecd63c49e3593877e1c726293126fa')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_bc_name}
}
