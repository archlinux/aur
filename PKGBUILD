# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=psych
_cranver=1.8.4
pkgname=r-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="Procedures for psychological, psychometric, and personality research."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL-2' 'GPL-3')
depends=('r>=2.10' 'r-mnormt')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('3f56f9c5d4cd6717b4c711b2b64b092e') 

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
