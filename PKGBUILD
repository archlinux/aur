# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=purrr
_cranver=0.2.4
pkgname=r-cran-$_cranname
pkgver=${_cranver}
pkgrel=2
pkgdesc="A complete and consistent functional programming toolkit for R."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL-3')
depends=('r>=3.1' 'r-magrittr>=1.5' 'r-rlang>=0.1' 'r-cran-tibble')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('d9a11e6c14771beb3ebe8f4771a552f3') 

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
