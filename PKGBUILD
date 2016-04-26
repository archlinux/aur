pkgname=r-cran-gdal
_cranname=rgdal
_cranrel=8
pkgver=1.1
pkgrel=1
pkgdesc="Bindings for the Geospatial Data Abstraction Library"
url="https://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('x86_64' 'i686')
license=('GPL2' 'GPL3')
depends=('gdal>=1.6.3' 'proj>=4.4.9' 'r' 'r-cran-sp')
source=(https://cran.r-project.org/src/contrib/${_cranname}_${pkgver}-${_cranrel}.tar.gz)
md5sums=('52cda5344085fe3a088b21be80505b43')

package() {
	mkdir -p ${pkgdir}/usr/lib/R/library
	cd "${srcdir}"
	R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}

