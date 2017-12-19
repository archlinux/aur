# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_cranname=viridisLite
_cranver=0.2.0
pkgname="r-cran-viridislite"
pkgver="${_cranver}"
pkgrel=1
pkgdesc="Default Color Maps from 'matplotlib', lite version"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('04a04415cf651a2b5f964b261896c0fb')

package() {
    mkdir -p "${pkgdir}/usr/lib/R/library"
    cd "${srcdir}"
    R CMD INSTALL "${_cranname}" -l "${pkgdir}/usr/lib/R/library"
}
