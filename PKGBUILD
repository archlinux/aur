# Maintainer: frichtlm <frichtlm@gmail.com>
# Contributor: wagnerflo <florian@wagner-flo.net>
_cranname=tibble
_cranver=1.4.2
pkgname=r-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="Provides a 'tbl_df' class (the 'tibble') that provides stricter checking and better formatting than the traditional data frame."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r>=3.1.0' 'r-cran-cli' 'r-crayon' 'r-cran-pillar>=1.1.0' 'r-rlang')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('af90f04967af019155d8c6f52f488799')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
