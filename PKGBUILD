# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=nlme
_cranver=3.1-131
pkgname=r-cran-$_cranname
pkgver=3.1_131
pkgrel=1
pkgdesc="Linear and nonlinear mixed effects models."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL2' 'GPL3')
depends=('r>=3.0.2')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('0f1215ec4d4e3bca939282d122f4d1fa')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
