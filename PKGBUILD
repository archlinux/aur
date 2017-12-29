# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_cranname=utf8
_cranver=1.1.2
pkgname="r-cran-${_cranname}"
pkgver="${_cranver}"
pkgrel=1
pkgdesc="R functions for processing and printing UTF-8 encoded unicode"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('Apache-2.0')
depends=('r')
conflicts=('r-utf8')
provides=('r-utf8')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('1a2de4ce1831edf1bf978234d72de26d')

package() {
    mkdir -p "${pkgdir}/usr/lib/R/library"
    cd "${srcdir}"
    R CMD INSTALL "${_cranname}" -l "${pkgdir}/usr/lib/R/library"
}
