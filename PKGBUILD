
_cranname=DiceKriging
_cranver=1.5.5
pkgname="r-cran-dicekriging"
pkgver="${_cranver}"
pkgrel=1
pkgdesc="Estimation, validation and prediction of kriging models."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('55fe161f867a0c3772023c3047041b877aa54d29cb474ec87293ec31cc5cb30c')

package() {
    mkdir -p "${pkgdir}/usr/lib/R/library"
    cd "${srcdir}"
    R CMD INSTALL "${_cranname}" -l "${pkgdir}/usr/lib/R/library"
}
