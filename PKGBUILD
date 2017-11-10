#Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=openlayers
pkgver=4.4.2
pkgrel=1
pkgdesc='A high-performance, feature-packed JavaScript library for displaying map data.'
arch=('any')
url='http://openlayers.org/'
license=('BSD')
source=("https://github.com/openlayers/ol3/releases/download/v${pkgver}/v${pkgver}-dist.zip"
        "LICENSE.txt")
sha256sums=('5c3b10e0fd81bec8486c39e8610a024e2d21899cda20f5f2ebd2cfcc94a505ef'
            'd00addee76cd5bb68fa012b880d8be2c0fb1677a9cbd53bf7256adb644668247')

package() {
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  cp -a ${srcdir}/v${pkgver}-dist/* ${pkgdir}/usr/share/javascript/${pkgname}
  cp -L ./LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
