# Maintainer: Charles Vejnar

pkgname=r-deseq2
_bc_name=DESeq2
pkgver=1.34.0
pkgrel=1
pkgdesc="Differential gene expression analysis based on the negative binomial distribution."
url="https://bioconductor.org/packages/release/bioc/html/DESeq2.html"
arch=("x86_64")
license=("LGPL3")
depends=("r" "r-s4vectors" "r-iranges" "r-genomicranges" "r-summarizedexperiment")
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bc_name}_${pkgver}.tar.gz")
sha1sums=("2316fc43f8a114cb515998a39fc2a46ed4a6a07a")

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_bc_name}
}
