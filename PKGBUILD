# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_cranname=viridisLite
_cranver=0.3.0
pkgname="r-cran-viridislite"
pkgver="${_cranver}"
pkgrel=1
pkgdesc="Default Color Maps from 'matplotlib' (Lite Version)"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('780ea12e7c4024d5ba9029f3a107321c74b8d6d9165262f6e64b79e00aa0c2af')

package() {
    mkdir -p "${pkgdir}/usr/lib/R/library"
    cd "${srcdir}"
    R CMD INSTALL "${_cranname}" -l "${pkgdir}/usr/lib/R/library"
}
