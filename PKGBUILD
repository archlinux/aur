# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=forcats
_cranver=0.2.0
pkgname=r-cran-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="Tools for working with categorical variables."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('r>=2.10' 'r-magrittr' 'r-cran-tibble')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('e4ba2c0a59dcdfcc02274c519bf3dbfc') 

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
