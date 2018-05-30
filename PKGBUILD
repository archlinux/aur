# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=BH
_cranver=1.66.0-1
pkgname=r-bh
pkgver=1.66.0_1
pkgrel=1
pkgdesc="Provides free peer-reviewed portable C++ source libraries."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('BSL-1.0')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('534bb3a301293d3a0880b8eb63115467') 

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
