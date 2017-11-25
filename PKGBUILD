# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=momentjs-jalaali
pkgver=0.7.1
pkgrel=1
pkgdesc='A Jalaali (Jalali, Persian, Khorshidi, Shamsi) calendar system plugin for moment.js JavaScript library.'
arch=('any')
url='https://github.com/jalaali/moment-jalaali'
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jalaali/moment-jalaali/archive/v${pkgver}.tar.gz")
sha256sums=('de90cbe7eb80f9bc829fea98498fdd60b72c5a84bd16a1984a2f0780b721fca5')

package() {  
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  cp -a ${srcdir}/moment-jalaali-${pkgver}/build/*.js ${pkgdir}/usr/share/javascript/${pkgname}/
}
# vim:set ts=2 sw=2 et:
