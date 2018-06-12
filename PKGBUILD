# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=mnormt
_cranver=1.5-5
pkgname=r-$_cranname
pkgver=1.5_5
pkgrel=2
pkgdesc="The multivariate Normal and T distributions."
url="https://cran.r-project.org/package=${_cranname}"
arch=('i686' 'x86_64')
license=('GPL-2' 'GPL-3')
depends=('r>=2.2.0')
makedepends=('gcc-fortran')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('19b5be2e9ed33b92d7a716bfcca6b2c7')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
