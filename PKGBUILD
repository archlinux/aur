# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=openlayers
pkgver=5.1.2
pkgrel=1
pkgdesc='A high-performance, feature-packed JavaScript library for displaying map data.'
arch=('any')
url='http://openlayers.org/'
license=('BSD')
source=("${pkgname}-${pkgver}.zip::https://github.com/openlayers/openlayers/releases/download/v${pkgver}/v${pkgver}-dist.zip")
sha256sums=('5cc2f7a2252f552612fe297da042e194e66a84fd803df51cda61e62808c4eda2')

package() {
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  cp -a ${srcdir}/v${pkgver}-dist/* ${pkgdir}/usr/share/javascript/${pkgname}
}
# vim:set ts=2 sw=2 et:
