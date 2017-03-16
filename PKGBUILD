# Contributor: Sauliusl <luksaulius at gmail>
pkgname=r-biocgenerics
pkgver=0.20.0
pkgrel=1
pkgdesc="S4 generic functions needed by many Bioconductor packages."
arch=('i686' 'x86_64')
url="https://bioconductor.org/packages/release/bioc/html/BiocGenerics.html"
license=('Artistic-2.0')
depends=('r')
source=("https://bioconductor.org/packages/release/bioc/src/contrib/BiocGenerics_${pkgver}.tar.gz")
sha1sums=('aa9bd7cc80c8af430badee6b16fc1dd4b91afe6c')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./BiocGenerics
}
