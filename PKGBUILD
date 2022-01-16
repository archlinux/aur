# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=gmt-dcw
pkgver=2.1.0
pkgrel=1
pkgdesc="The Digital Chart of the World Polygon data for the Generic Mapping Tools."
arch=('any')
url="https://github.com/GenericMappingTools/dcw-gmt"
license=('LGPL')
depends=('gmt>=6.1.1')
source=("${url}/releases/download/${pkgver}/dcw-gmt-${pkgver}.tar.gz")
sha256sums=('e810567cd474d5af9d84751938acb447a8612391ed66190d60d789974a1f9e29')

package() {
    install -d "${pkgdir}/usr/share/gmt/dcw"
    install -m 644 "dcw-gmt-${pkgver}"/* "${pkgdir}/usr/share/gmt/dcw/"
}
# vim:set ts=4 sw=4 et:
