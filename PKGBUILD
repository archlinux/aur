 pkgname=r-optparse
 pkgver=1.7.3
 pkgrel=1
 pkgdesc="R command line parser inspired by Python's 'optparse'"
 arch=('any')
 url="https://cran.r-project.org/package=optparse"
 license=('GPL')
 depends=('r-getopt>=1.20.2')
 optdepends=('r-knitr>=2.15.19' 'r-stringr' 'r-testthat')
 source=("https://cran.r-project.org/src/contrib/optparse_$pkgver.tar.gz")
md5sums=('48866cfb596f7dafc503c09954ab9f46')

 build(){
     R CMD INSTALL optparse_"$pkgver".tar.gz -l "$srcdir"
 }
 package() {
     install -dm0755 "$pkgdir"/usr/lib/R/library
     cp -a --no-preserve=ownership optparse "$pkgdir"/usr/lib/R/library
 }
