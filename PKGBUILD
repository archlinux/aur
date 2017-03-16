# Contributor: Sauliusl <luksaulius at gmail>
pkgname=r-s4vectors
pkgver=0.12.1
pkgrel=1
pkgdesc="S4 implementation of vectors and lists"
arch=('i686' 'x86_64')
url="https://bioconductor.org/packages/release/bioc/html/S4Vectors.html"
license=('Artistic-2.0')
depends=('r' 'r-biocgenerics')
source=("https://bioconductor.org/packages/release/bioc/src/contrib/S4Vectors_${pkgver}.tar.gz")
sha1sums=('b5231866a901fb44096439e89ffc90337de4a6cb')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./S4Vectors
}
