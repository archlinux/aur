 pkgname=r-getopt
 pkgver=1.20.4
 pkgrel=1
 pkgdesc="C-Like 'getopt' Behavior"
 arch=('any')
 url="https://cran.r-project.org/package=getopt"
 license=('GPL')
 depends=('r>=2.9')
 optdepends=('r-covr' 'r-testthat')
 source=("https://cran.r-project.org/src/contrib/getopt_$pkgver.tar.gz")
md5sums=('78783a3b9aa4c05177b71cf992ff89c6')

 build(){
     R CMD INSTALL getopt_"$pkgver".tar.gz -l "$srcdir"
 }
 package() {
     install -dm0755 "$pkgdir"/usr/lib/R/library
     cp -a --no-preserve=ownership getopt "$pkgdir"/usr/lib/R/library
 }
