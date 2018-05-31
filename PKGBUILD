# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=forcats
_cranver=0.3.0
pkgname=r-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="Tools for working with categorical variables."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL-3')
depends=('r>=3.1' 'r-magrittr' 'r-rlang' 'r-tibble')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('9e8ef180bf65b20b1085707ab8ed5224') 

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
