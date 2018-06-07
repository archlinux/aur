# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=momentjs
pkgver=2.22.2
pkgrel=1
pkgdesc='A JavaScript library for parsing, validating, manipulating, and displaying dates and times.'
arch=('any')
url='http://momentjs.com/'
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/moment/moment/archive/${pkgver}.tar.gz")
sha256sums=('52c253ad0e8645d2e8ed61fb15d1067821d0bc7f211a7520f585521c1480177f')

package() {
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  cp -a ${srcdir}/moment-${pkgver}/min/*.js ${pkgdir}/usr/share/javascript/${pkgname}/
}
# vim:set ts=2 sw=2 et:
