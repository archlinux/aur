# Maintainer: Thomas Wood <grand.edgemaster@gmail.com>
pkgname=proj-datumgrid-europe
pkgver=1.6
pkgrel=1
pkgdesc="Proj datum grids for Europe"
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
sha256sums=('c596ad4cc995c19c407f24a9a76a714300240b7691bf86fd3393ab0f65ba15a0')
