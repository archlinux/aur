# Maintainer: fordprefect <fordprefect@dukun.de>
_cranname=bit
_cranver=1.1-13
pkgname=r-cran-$_cranname
pkgver=1.1_13
pkgrel=1
pkgdesc="A class for vectors of 1-bit booleans"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('df6a1aaa5f15074fe697f012289d181f')
 
package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
