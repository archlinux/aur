# $Id$
# Maintainer: Kianoosh Hooshmand <kianoosh.hoooshmand at gmail dot com>

pkgname=jalali-momentjs
pkgver=3.3.1
pkgrel=1
pkgdesc='Display, parse, manipulate and validate jalali (Persian, Khorshidi, Shamsi) or Gregorian (Miladi) dates and times and also convert Jalali (Persian, Khorshidi, Shamsi) date to Gregorian (Miladi) or vice versa in javascript or typescript.'
arch=('any')
url='https://github.com/fingerpich/jalali-moment'
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fingerpich/jalali-moment/archive/v${pkgver}.tar.gz")
sha256sums=('4a5e65b4f8d1388aa98dc1effc05a71b1b54be8359b192d850fab4c209bc50f7')

package() {  
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  cp -a ${srcdir}/jalali-moment-${pkgver}/dist/*.{js,map} ${pkgdir}/usr/share/javascript/${pkgname}/
}
# vim:set ts=2 sw=2 et:
