# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=pkgconfig
_cranver=2.0.1
pkgname=r-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="Set R package configuration options on a per-package basis."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('a20fd9588e37995995fa62dc4828002e') 

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
