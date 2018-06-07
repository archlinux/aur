# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=momentjs-jalaali
pkgver=0.7.3
pkgrel=1
pkgdesc='A Jalaali (Jalali, Persian, Khorshidi, Shamsi) calendar system plugin for moment.js JavaScript library.'
arch=('any')
url='https://github.com/jalaali/moment-jalaali'
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jalaali/moment-jalaali/archive/v${pkgver}.tar.gz")
sha256sums=('43b8edb61a5afd5caf9e0b63279afc15d5c3c674105b2233830aef7a49c4e184')

package() {
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  cp -a ${srcdir}/moment-jalaali-${pkgver}/build/*.js ${pkgdir}/usr/share/javascript/${pkgname}/
}
# vim:set ts=2 sw=2 et:
