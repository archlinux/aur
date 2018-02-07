# $Id$
#Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=leaflet
pkgver=1.3.1
pkgrel=1
pkgdesc='A JavaScript library for mobile-friendly interactive maps.'
arch=('any')
url='http://leafletjs.com/'
license=('BSD')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Leaflet/Leaflet/archive/v${pkgver}.tar.gz")
sha256sums=('fd927ebfe9166e2627c846c6d6ee68125d7c58018574da5e22e785f143eb33d1')

package() {
  cd Leaflet-${pkgver}
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  cp -a ./dist/* $pkgdir/usr/share/javascript/$pkgname/
  cp -a ./LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
# vim:set ts=2 sw=2 et:
