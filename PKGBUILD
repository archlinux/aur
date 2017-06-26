# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=foreign
_cranver=0.8-69
pkgname=r-cran-$_cranname
pkgver=0.8_69
pkgrel=1
pkgdesc="Read data stored by other statistical analysis software."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL2' 'GPL3')
depends=('r>=3.0.0')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('dfa310786eb31df7e2d53f0544f587db')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
