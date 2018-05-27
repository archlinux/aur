# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=StanHeaders
_cranver=2.17.2
pkgname=r-stanheaders
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="C++ header files of the Stan project"
url="https://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('x86_64')
license=('BSD')
depends=('r')
optdepends=('r-bh')
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('defb5a3bf4e429490ef34770b66410d4')

package() {
  mkdir -p ${pkgdir}/usr/lib/R/library
  cd "${srcdir}"
  R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}

