#Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=openlayers
pkgver=4.5.0
pkgrel=1
pkgdesc='A high-performance, feature-packed JavaScript library for displaying map data.'
arch=('any')
url='http://openlayers.org/'
license=('BSD')
source=("https://github.com/openlayers/openlayers/releases/download/v${pkgver}/v${pkgver}-dist.zip")
sha256sums=('791cb4ec5ce691ad0b34ff6c69a1dea5a8e331d1d59ccd6679766d7ce6747424')

package() {
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  cp -a ${srcdir}/v${pkgver}-dist/* ${pkgdir}/usr/share/javascript/${pkgname}
}
