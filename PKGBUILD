# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=forcats
_cranver=0.4.0
pkgname=r-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="Tools for working with categorical variables."
url="https://cran.r-project.org/package=forcats"
arch=('i686' 'x86_64')
license=('GPL-3')
depends=('r>=3.1' 'r-ellipsis' 'r-magrittr' 'r-rlang' 'r-tibble')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('45a41b86264c1722c2ab65cdc8c138ee') 

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
