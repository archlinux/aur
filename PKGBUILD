# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=gmt-dcw
pkgver=2.0.2
pkgrel=1
pkgdesc="The Digital Chart of the World Polygon data for the Generic Mapping Tools."
arch=('any')
url="https://www.generic-mapping-tools.org/"
license=('LGPL')
source=("https://github.com/GenericMappingTools/dcw-gmt/releases/download/${pkgver}/dcw-gmt-${pkgver}.tar.gz")
sha256sums=('2b300f01ca350db17aadd0260ae33bf36dc6b61be4150e66829033cec3d65c3c')

package() {
	mkdir -p ${pkgdir}/usr/share/gmt/dcw
	install -m 644 dcw-gmt-${pkgver}/* ${pkgdir}/usr/share/gmt/dcw/
}
# vim:set ts=4 sw=4:
