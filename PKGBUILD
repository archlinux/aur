# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=gmt-dcw
pkgver=2.1.2
pkgrel=1
pkgdesc="The Digital Chart of the World Polygon data for the Generic Mapping Tools."
arch=('any')
url="https://github.com/GenericMappingTools/dcw-gmt"
license=('LGPL')
depends=('gmt>=6.1.1')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/dcw-gmt-${pkgver}.tar.gz")
sha256sums=('4bb840d075c8ba3e14aeb41cf17c24236bff787566314f9ff758ab9977745d99')

package() {
    cd "dcw-gmt-${pkgver}"
    install -Dm0644 -t "${pkgdir}/usr/share/gmt/dcw" dcw-*
    install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
# vim:set ts=4 sw=4 et:
