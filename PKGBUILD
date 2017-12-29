# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_cranname=cli
_cranver=1.0.0
pkgname="r-cran-${_cranname}"
pkgver="${_cranver}"
pkgrel=1
pkgdesc="R tools to design and build attractive CLI interfaces with ASCII and unicode support"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r' 'r-cran-assertthat' 'r-crayon')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('e6c4169541d394d6d435c4b430b1dd77')

package() {
    mkdir -p "${pkgdir}/usr/lib/R/library"
    cd "${srcdir}"
    R CMD INSTALL "${_cranname}" -l "${pkgdir}/usr/lib/R/library"
}
