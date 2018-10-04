# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_cranname=cli
_cranver=1.0.1
pkgname="r-${_cranname}"
pkgver="${_cranver}"
pkgrel=1
pkgdesc="R tools to design and build attractive CLI interfaces with ASCII and unicode support"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r' 'r-assertthat' 'r-crayon')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('ef80fbcde15760fd55abbf9413b306e3971b2a7034ab8c415fb52dc0088c5ee4')

package() {
    mkdir -p "${pkgdir}/usr/lib/R/library"
    cd "${srcdir}"
    R CMD INSTALL "${_cranname}" -l "${pkgdir}/usr/lib/R/library"
}
