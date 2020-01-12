 pkgname=r-optparse
 pkgver=1.6.4
 pkgrel=1
 pkgdesc="R command line parser inspired by Python's 'optparse'"
 arch=('any')
 url="https://cran.r-project.org/package=optparse"
 license=('GPL')
 depends=('r-getopt>=1.20.2')
 optdepends=('r-covr' 'r-knitr>=1.15.19' 'r-stringr' 'r-testthat')
 source=("https://cran.r-project.org/src/contrib/optparse_$pkgver.tar.gz")
 md5sums=('2627a0b1d96c86d23657b66a6f26e835')

 build(){
     R CMD INSTALL optparse_"$pkgver".tar.gz -l "$srcdir"
 }
 package() {
     install -dm0755 "$pkgdir"/usr/lib/R/library
     cp -a --no-preserve=ownership optparse "$pkgdir"/usr/lib/R/library
 }
