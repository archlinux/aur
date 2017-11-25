# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=momentjs-timezone
pkgver=0.5.14
pkgrel=1
pkgdesc='A JavaScript library for parsing and displaying dates in any timezone.'
arch=('any')
url='http://momentjs.com/timezone/'
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/moment/moment-timezone/archive/${pkgver}.tar.gz")
sha256sums=('713297d1f6500a286e78f818d9b5e6072ed98f24ef0d98dbca24db2309348de5')

package() {  
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  cp -a ${srcdir}/moment-timezone-${pkgver}/builds/*.js ${pkgdir}/usr/share/javascript/${pkgname}/
}
# vim:set ts=2 sw=2 et:
