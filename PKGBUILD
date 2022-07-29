# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=gmt-dcw
pkgver=2.1.1
pkgrel=1
pkgdesc="The Digital Chart of the World Polygon data for the Generic Mapping Tools."
arch=('any')
url="https://github.com/GenericMappingTools/dcw-gmt"
license=('LGPL')
depends=('gmt>=6.1.1')
source=("${url}/releases/download/${pkgver}/dcw-gmt-${pkgver}.tar.gz")
sha256sums=('d4e208dca88fbf42cba1bb440fbd96ea2f932185c86001f327ed0c7b65d27af1')

package() {
    install -d "${pkgdir}/usr/share/gmt/dcw"
    install -m 644 "dcw-gmt-${pkgver}"/* "${pkgdir}/usr/share/gmt/dcw/"
}
# vim:set ts=4 sw=4 et:
