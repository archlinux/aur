# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-zlibbioc
_bc_name=zlibbioc
pkgver=1.28.0
pkgrel=1
pkgdesc="An R packaged zlib"
url="https://bioconductor.org/packages/release/bioc/html/BiocGenerics.html"
arch=("x86_64")
license=('Artistic-2.0')
depends=('r')
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bc_name}_${pkgver}.tar.gz")
sha1sums=('061522bdbc99d3d02512622e9efe3073f0460579')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_bc_name}
}
