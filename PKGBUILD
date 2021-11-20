# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=gmt-dcw
pkgver=2.0.1
pkgrel=1
pkgdesc="The Digital Chart of the World Polygon data for the Generic Mapping Tools."
arch=('any')
url="https://www.generic-mapping-tools.org/"
license=('LGPL')
source=("https://github.com/GenericMappingTools/dcw-gmt/releases/download/${pkgver}/dcw-gmt-${pkgver}.tar.gz")
sha256sums=('5c90b2968f4095cf5ea44a354dc9d8f9dd1b8fe5514e0338ff85b48e03547a25')

package() {
	mkdir -p ${pkgdir}/usr/share/gmt/dcw
	install -m 644 dcw-gmt-${pkgver}/* ${pkgdir}/usr/share/gmt/dcw/
}
# vim:set ts=4 sw=4:
