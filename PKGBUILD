# $Id$
#Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=leaflet
pkgver=1.2.0
pkgrel=2
pkgdesc='A JavaScript library for mobile-friendly interactive maps.'
arch=('any')
url='http://leafletjs.com/'
license=('BSD')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Leaflet/Leaflet/archive/v${pkgver}.tar.gz")
sha256sums=('c7700025de5e54c0738e3cbcaf7a0bdb4ed262b78a773fce5f2362a038b75df4')

package() {
  cd Leaflet-${pkgver}
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  cp -a ./dist/* $pkgdir/usr/share/javascript/$pkgname/
  cp -a ./LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
# vim:set ts=2 sw=2 et:
