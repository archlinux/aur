# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=momentjs-timezone
pkgver=0.5.17
pkgrel=1
pkgdesc='A JavaScript library for parsing and displaying dates in any timezone.'
arch=('any')
url='http://momentjs.com/timezone/'
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/moment/moment-timezone/archive/${pkgver}.tar.gz")
sha256sums=('04cf8b951d841b997f485a1cdd746711be254d4a03f3c393b37a099243223c5a')

package() {
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  cp -a ${srcdir}/moment-timezone-${pkgver}/builds/*.js ${pkgdir}/usr/share/javascript/${pkgname}/
}
# vim:set ts=2 sw=2 et:
