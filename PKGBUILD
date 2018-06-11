# Maintainer: portaloffreedom

_cranname=repr
_cranver=0.12.0
pkgname=r-${_cranname}
pkgver=${_cranver}
pkgrel=1
pkgdesc="String and binary representations of objects for several formats / mime types"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('r>=3.0.0')
provides=("r-cran-${_cranname}")
conflicts=("r-cran-${_cranname}")
replaces=("r-cran-${_cranname}")
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('61b40a925e4eee7933facc54f00560f2')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
