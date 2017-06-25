# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=hms
_cranver=0.3
pkgname=r-cran-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="Pretty time of day class implementation."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('92c4a0cf0c402a35145b5bb57212873e') 

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
