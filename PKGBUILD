# Maintainer: fordprefect <fordprefect@dukun.de>
_cranname=random
pkgname=r-cran-$_cranname
pkgver=0.2.3
pkgrel=1
pkgdesc="interface to true random number source random.org for r language"
url="http://cran.r-project.org/web/packages/random/index.html"
arch=('any')
license=('GPL3')
depends=('r')
install=''
source=("http://cran.r-project.org/src/contrib/${_cranname}_${pkgver}.tar.gz")
md5sums=('298eac68e17d3be20c065956ba1796fe')
 
package() {
    mkdir -p "${pkgdir}/usr/lib/R/library"
    cd "${srcdir}"
    R CMD INSTALL $_cranname -l "${pkgdir}/usr/lib/R/library"
}
