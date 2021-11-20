# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Benjamin Sick
pkgname=gmt-coast
pkgver=2.3.7
pkgrel=2
pkgdesc="The full resolution coastline dataset for the Generic Mapping Tools."
arch=('any')
url="https://www.generic-mapping-tools.org/"
license=('LGPL')
source=("https://github.com/GenericMappingTools/gshhg-gmt/releases/download/${pkgver}/gshhg-gmt-${pkgver}.tar.gz")
sha256sums=('9bb1a956fca0718c083bef842e625797535a00ce81f175df08b042c2a92cfe7f')

package() {
	mkdir -p ${pkgdir}/usr/share/gmt/coast
	install -m 644 gshhg-gmt-${pkgver}/*.nc \
		${pkgdir}/usr/share/gmt/coast/
}
# vim:set ts=4 sw=4:
