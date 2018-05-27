# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=bindr
_cranver=0.1.1
pkgname=r-cran-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="Provides a simple interface for creating active bindings where the bound function accepts additional arguments."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('cfa02c563196a79bf8bb4db2e66585fd') 

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
