# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_cranname=R6
_cranver=2.2.2
pkgname="r-cran-r6"
pkgver="${_cranver}"
pkgrel=2
pkgdesc="R package to generate classes with reference semantics"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r')
conflicts=('r-r6')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('635b58c65bff624a1fab69c6b1989801')

package() {
    mkdir -p "${pkgdir}/usr/lib/R/library"
    cd "${srcdir}"
    R CMD INSTALL "${_cranname}" -l "${pkgdir}/usr/lib/R/library"
}
