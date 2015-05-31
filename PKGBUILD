# Maintainer: fordprefect <fordprefect@dukun.de>
_cranname=bit
_cranver=1.1-12
pkgname=r-cran-$_cranname
pkgver=1.1_12
pkgrel=1
pkgdesc="A class for vectors of 1-bit booleans"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('c4473017beb93f151a8e672e4d5747af')
 
package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
