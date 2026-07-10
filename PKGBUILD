 pkgname=r-getopt
 pkgver=1.21.1
 pkgrel=1
 pkgdesc="C-Like 'getopt' Behavior"
 arch=('any')
 url="https://cran.r-project.org/package=getopt"
 license=('GPL')
 depends=('r>=2.9')
 optdepends=('r-covr' 'r-testthat')
 source=("https://cran.r-project.org/src/contrib/getopt_$pkgver.tar.gz")
md5sums=('93f58b28b2524783d7752d274dbc815b')

 build(){
     R CMD INSTALL getopt_"$pkgver".tar.gz -l "$srcdir"
 }
 package() {
     install -dm0755 "$pkgdir"/usr/lib/R/library
     cp -a --no-preserve=ownership getopt "$pkgdir"/usr/lib/R/library
 }
