# $Id$
# Maintainer: Kianoosh Hooshmand <kianoosh.hoooshmand@gmail.com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=jalali-momentjs
pkgver=3.3.1
pkgrel=1
pkgdesc='Display, parse, manipulate, validate and convert jalali (Persian, Khorshidi, Shamsi) or Gregorian (Miladi) dates and times.'
arch=('any')
url='https://github.com/fingerpich/jalali-moment'
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fingerpich/jalali-moment/archive/v${pkgver}.tar.gz")
sha256sums=('6ad86260fcedcd203659ae5d27a3941c2808b400745f4744307d3c81f00336a4')

package() {  
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  cp -a ${srcdir}/jalali-moment-${pkgver}/dist/*.{js,map} ${pkgdir}/usr/share/javascript/${pkgname}/
}
# vim:set ts=2 sw=2 et:
