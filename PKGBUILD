# $Id$
#Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=bootswatch
pkgver=4.1.1
pkgrel=1
pkgdesc='A collection of open source themes for Bootstrap.'
arch=('any')
url='https://bootswatch.com/'
license=('MIT')
depends=('bootstrap')
source=("${pkgname}-${pkgver//_/-}.tar.gz::https://github.com/thomaspark/${pkgname}/archive/v${pkgver//_/-}.tar.gz")
sha256sums=('e4a9f6666017fe73d01f38aad9b528d004697dc760a8dc936fa8826f12a43fe9')

package() {
  cd ${pkgname}-${pkgver//_/-}
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  cp -a ./dist/* ${pkgdir}/usr/share/javascript/${pkgname}/
}
# vim:set ts=2 sw=2 et:
