# Maintainer: portaloffreedom

_cranname=gdtools
_cranver=0.1.7
pkgname=r-cran-gdtools
pkgver=${_cranver}
pkgrel=1
pkgdesc="Useful tools for writing vector graphics devices"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('r>=3.0.0' 'r-cran-withr')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('ffad0248bf8b676ca7721239076492f0')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
