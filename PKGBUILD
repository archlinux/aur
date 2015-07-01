# Maintainer: fordprefect <fordprefect@dukun.de>
_cranname=random
pkgname=r-cran-$_cranname
pkgver=0.2.5
pkgrel=1
pkgdesc="interface to true random number source random.org for r language"
url="http://cran.r-project.org/web/packages/random/index.html"
arch=('any')
license=('GPL3')
depends=('r' 'r-cran-curl')
install=''
source=("http://cran.r-project.org/src/contrib/${_cranname}_${pkgver}.tar.gz")
md5sums=('34f9d0786f88611ef5fe00e0e20470dc')
 
package() {
    mkdir -p "${pkgdir}/usr/lib/R/library"
    cd "${srcdir}"
    R CMD INSTALL $_cranname -l "${pkgdir}/usr/lib/R/library"
}
