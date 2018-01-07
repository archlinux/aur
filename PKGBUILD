# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_cranname=utf8
_cranver=1.1.3
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
md5sums=('3a4d84328eb3314e8ebb84d3553f7015')

package() {
    mkdir -p "${pkgdir}/usr/lib/R/library"
    cd "${srcdir}"
    R CMD INSTALL "${_cranname}" -l "${pkgdir}/usr/lib/R/library"
}
