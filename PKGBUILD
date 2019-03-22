# $Id$
# Maintainer: Alireza Ayinmehr <alireza.darksun@gmail.com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=leaflet
pkgver=1.4.0
pkgrel=1
pkgdesc='A JavaScript library for mobile-friendly interactive maps.'
arch=('any')
url='http://leafletjs.com/'
license=('BSD')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Leaflet/Leaflet/archive/v${pkgver}.tar.gz")
sha256sums=('24a5d44a8fd99d549ac797cefe7befd8c2f95d110394e35be4afc61eec00ee44')

package() {
  cd Leaflet-${pkgver}
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  cp -a ./dist/* $pkgdir/usr/share/javascript/$pkgname/
  cp -a ./LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
# vim:set ts=2 sw=2 et:
