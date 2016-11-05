#Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=openlayers
pkgver=3.19.1
pkgrel=1
pkgdesc='A high-performance, feature-packed JavaScript library for displaying map data.'
arch=('any')
url='http://openlayers.org/'
license=('BSD')
source=("https://github.com/openlayers/ol3/releases/download/v${pkgver}/v${pkgver}-dist.zip"
        "LICENSE.txt")
md5sums=('b2e73ba344008337424ba979d6986bb4'
         'ad650727154af9d966f3ac1be150eff3')

package() {  
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  cp -a ${srcdir}/v${pkgver}-dist/* ${pkgdir}/usr/share/javascript/${pkgname}
  cp -L ./LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
