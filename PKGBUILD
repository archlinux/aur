# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=momentjs
pkgver=2.19.2
pkgrel=1
pkgdesc='A JavaScript library for parsing, validating, manipulating, and displaying dates and times.'
arch=('any')
url='http://momentjs.com/'
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/moment/moment/archive/${pkgver}.tar.gz")
sha256sums=('6b343268adbfc8170f36724d2944dd2addcb8d0ba2a01f86d300ed8720848d9d')

package() {  
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  cp -a ${srcdir}/moment-${pkgver}/min/*.js ${pkgdir}/usr/share/javascript/${pkgname}/
}
# vim:set ts=2 sw=2 et:
