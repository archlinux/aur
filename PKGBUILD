# Maintainer: Thomas Wood <grand.edgemaster@gmail.com>
pkgname=proj-datumgrid-north-america
pkgver=1.4
pkgrel=1
pkgdesc="Proj datum grids for North America"
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
sha256sums=('eb8a1b6fa96580e88555fb1ce3e61aa6d02e07b7d6d0023aecf2cebfa575becf')
