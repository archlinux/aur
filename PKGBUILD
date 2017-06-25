# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=plogr
_cranver=0.1-1
pkgname=r-cran-$_cranname
pkgver=0.1_1
pkgrel=1
pkgdesc="A simple header-only logging library for C++."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('5ee46ed21b5c571d02900219098517c0') 

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
