# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=pkgconfig
_cranver=2.0.2
pkgname=r-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="Set R package configuration options on a per-package basis."
url="https://cran.r-project.org/package=pkgconfig"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r')
optdepends=('r-covr' 'r-testthat' 'r-disposables')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('65742ce8a9e6d167f5c4181a61ca7ff2') 

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
