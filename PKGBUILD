# Maintainer: Thomas Wood <grand.edgemaster@gmail.com>
pkgname=proj-datumgrid-oceania
pkgver=1.2
pkgrel=1
pkgdesc="Proj datum grids for Oceania"
arch=('any')
url="https://github.com/OSGeo/proj-datumgrid"
license=('custom')
depends=('proj')
source=("https://download.osgeo.org/proj/${pkgname}-${pkgver}.zip")
noextract=("${pkgname}-${pkgver}.zip")

package() {
	install -d ${pkgdir}/usr/share/proj
	bsdtar --no-same-owner -xzvf "${srcdir}"/${pkgname}-${pkgver}.zip -C "${pkgdir}"/usr/share/proj
}
sha256sums=('7da6829ed2067cc7f294e06b57c86fc258e7355230d88e6dbf830854e768d942')
