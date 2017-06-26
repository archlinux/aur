# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=psych
_cranver=1.7.5
pkgname=r-cran-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="Procedures for psychological, psychometric, and personality research."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL2' 'GPL3')
depends=('r>=2.10' 'r-cran-foreign' 'r-cran-lattice' 'r-cran-mnormt' 'r-cran-nlme')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('ba682798397acd299b0b3ed2a397d7ec') 

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
