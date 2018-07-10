#Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=openlayers
pkgver=5.0.2
pkgrel=1
pkgdesc='A high-performance, feature-packed JavaScript library for displaying map data.'
arch=('any')
url='http://openlayers.org/'
license=('BSD')
source=("${pkgname}-${pkgver}.zip::https://github.com/openlayers/openlayers/releases/download/v${pkgver}/v${pkgver}-dist.zip")
sha256sums=('05bb6fef43da08d2c1b670b9e94b71cbc68e530fbc63af9add9db2715d9adae8')

package() {
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  cp -a ${srcdir}/v${pkgver}-dist/* ${pkgdir}/usr/share/javascript/${pkgname}
}
# vim:set ts=2 sw=2 et:
