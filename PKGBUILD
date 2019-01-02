# $Id$
#Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=bootswatch
pkgver=4.2.1
pkgrel=1
pkgdesc='A collection of open source themes for Bootstrap.'
arch=('any')
url='https://bootswatch.com/'
license=('MIT')
depends=('bootstrap')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/thomaspark/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('f381ffa41eeaeef4a730b8ef9b2ee1e25cfb2fa18b477ccb6da2715e36a60ee4')

package() {
  cd ${pkgname}-${pkgver}
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  cp -a ./dist/* ${pkgdir}/usr/share/javascript/${pkgname}/
}
# vim:set ts=2 sw=2 et:
