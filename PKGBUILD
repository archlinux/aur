# Contributor: Sauliusl <luksaulius at gmail>
pkgname=r-iranges
pkgver=2.8.1
pkgrel=1
pkgdesc="Infrastructure for manipulating intervals on sequences"
arch=('i686' 'x86_64')
url="https://bioconductor.org/packages/release/bioc/html/S4Vectors.html"
license=('Artistic-2.0')
depends=('r' 'r-biocgenerics' 'r-s4vectors')
source=("https://bioconductor.org/packages/release/bioc/src/contrib/IRanges_${pkgver}.tar.gz")
sha1sums=('3dccfa93f3bc2e8bcb22f5f3e96f1d74179b2a5f')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./IRanges
}
