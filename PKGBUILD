# $Id$
#Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=bootswatch
pkgver=4.0.0_beta.2
pkgrel=1
pkgdesc='A collection of open source themes for Bootstrap.'
arch=('any')
url='https://bootswatch.com/'
license=('MIT')
depends=('bootstrap')
source=("${pkgname}-${pkgver//_/-}.tar.gz::https://github.com/thomaspark/${pkgname}/archive/v${pkgver//_/-}.tar.gz")
sha256sums=('cf752e1cd7fd99c5533d4d752009fd553cca525dc8ba555f5362bc3599cad5c6')

package() {
  cd ${pkgname}-${pkgver//_/-}
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  cp -a ./dist/* ${pkgdir}/usr/share/javascript/${pkgname}/
}
# vim:set ts=2 sw=2 et:
