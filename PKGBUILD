# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=glue
_cranver=1.2.0
pkgname=r-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="An implementation of interpreted string literals for R."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r>=3.1')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('77d06b6d86abc882fa1c0599e457c5e2') 

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
