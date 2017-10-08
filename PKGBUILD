# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=BH
_cranver=1.65.0-1
pkgname=r-cran-bh
pkgver=1.65.0_1
pkgrel=1
pkgdesc="Provides free peer-reviewed portable C++ source libraries."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('BSL1')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('7d0402188e4af59f4103f36616d6ee55') 

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
