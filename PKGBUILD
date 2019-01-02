# $Id$
#Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=bootstrap
pkgver=4.2.1
pkgrel=1
pkgdesc='A HTML, CSS, and JS framework for designing responsive, mobile first projects on the web.'
arch=('any')
url='https://getbootstrap.com/'
license=('MIT')
depends=('jquery')
source=("https://github.com/twbs/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-dist.zip")
sha256sums=('db2ac516f52dd8fbc4e1db15492d19b7aa1e6b928ba25ed32b878b432ee96d69')

package() {
  cd ${pkgname}-${pkgver}-dist
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  cp -a ./{css,js} ${pkgdir}/usr/share/javascript/${pkgname}/
}
# vim:set ts=2 sw=2 et:
