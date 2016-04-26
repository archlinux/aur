pkgname=r-cran-sp
_cranname=sp
_cranrel=3
pkgver=1.2
pkgrel=1
pkgdesc="Classes and Methods for Spatial Data"
url="https://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('x86_64' 'i686')
license=('GPL2' 'GPL3')
depends=('r')
source=(https://cran.r-project.org/src/contrib/${_cranname}_${pkgver}-${_cranrel}.tar.gz)
md5sums=('f0e24d993dec128642ee66b6b47b10c1')

package() {
	mkdir -p ${pkgdir}/usr/lib/R/library
	cd "${srcdir}"
	R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}

