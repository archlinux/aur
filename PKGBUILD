# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=BH
_cranver=1.69.0-1
pkgname=r-bh
pkgver=1.69.0_1
pkgrel=1
pkgdesc="Provides free peer-reviewed portable C++ source libraries."
url="https://cran.r-project.org/package=BH"
arch=('i686' 'x86_64')
license=('BSL-1.0')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('d602666e5dae040489a1ed4f208f623b') 

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
