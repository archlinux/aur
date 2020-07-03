# Maintainer: Thomas Wood <grand.edgemaster@gmail.com>
pkgname=proj-datumgrid-world
pkgver=1.0
pkgrel=1
pkgdesc="Worldwide Proj datum grids"
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
sha256sums=('cbffb31faecb16f3f7acbfe7e85e81440aa8d6eae670de7ec2d19a13c02b4681')
