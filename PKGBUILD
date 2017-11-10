#Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=leaflet
pkgver=1.2.0
pkgrel=1
pkgdesc='A JavaScript library for mobile-friendly interactive maps.'
arch=('any')
url='http://leafletjs.com/'
license=('custom')
provides=("${pkgname}" "leaflet")
conflicts=("${pkgname}" "leaflet")
source=("https://github.com/Leaflet/Leaflet/archive/v$pkgver.tar.gz")
sha256sums=('c7700025de5e54c0738e3cbcaf7a0bdb4ed262b78a773fce5f2362a038b75df4')

package() {
  cd $srcdir/Leaflet-$pkgver
  install -d $pkgdir/usr/share/javascript/$pkgname
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  cp -a ./dist/* $pkgdir/usr/share/javascript/$pkgname/
  cp -a ./LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
