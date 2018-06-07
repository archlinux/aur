# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=momentjs-hijri
pkgver=2.1.1
pkgrel=1
pkgdesc='A Hijri calendar (Based on Umm al-Qura calculations) plugin for moment.js JavaScript library.'
arch=('any')
url='https://github.com/xsoh/moment-hijri'
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xsoh/moment-hijri/archive/v${pkgver}.tar.gz")
sha256sums=('8b730659e7700b823ce7e0090ed676612658ee2e544206ff667bd95e3d05bcb1')

package() {
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  cp -a ${srcdir}/moment-hijri-${pkgver}/moment-hijri.js ${pkgdir}/usr/share/javascript/${pkgname}/
}
# vim:set ts=2 sw=2 et:
