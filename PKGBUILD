# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=BH
_cranver=1.62.0-1
pkgname=r-cran-bh
pkgver=1.62.0_1
pkgrel=1
pkgdesc="Provides free peer-reviewed portable C++ source libraries."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('BSL1')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('8b0316d7b0df3b1ca54bb5c030dfc079') 

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
