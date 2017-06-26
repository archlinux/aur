# Maintainer: frichtlm <frichtlm@gmail.com>
_cranname=lattice
_cranver=0.20-35
pkgname=r-cran-$_cranname
pkgver=0.20_35
pkgrel=1
pkgdesc="Trellis graphics for R."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL2' 'GPL3')
depends=('r>=3.0.0')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('07f1814623b3da6278ca61554ff7bfe6')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
