# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=hms
_cranver=0.5.0
pkgname=r-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="Implements an S3 class for storing and formatting time-of-day values, based on the 'difftime' class."
url="https://cran.r-project.org/package=hms"
arch=('i686' 'x86_64')
license=('GPL-3')
depends=('r' 'r-pkgconfig' 'r-rlang' 'r-vctrs>=0.2.0')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('fedba1b56a680c6e2da13b377042e023') 

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
