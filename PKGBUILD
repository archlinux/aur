#Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=leaflet
pkgver=1.0.1
pkgrel=1
pkgdesc='A JavaScript library for mobile-friendly interactive maps.'
arch=('any')
url='http://leafletjs.com/'
license=('custom')
provides=("${pkgname}" "leaflet")
conflicts=("${pkgname}" "leaflet")
source=("https://github.com/Leaflet/Leaflet/archive/v$pkgver.tar.gz")
sha256sums=('bbe31120b1d0824b4ea19318c44914d293106a8903eeb20688214423291570f8')

package() {
  cd $srcdir/Leaflet-$pkgver
  install -d $pkgdir/usr/share/javascript/$pkgname
  install -d ${pkgdir}/usr/share/doc/${pkgname}
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  cp -a ./dist/* $pkgdir/usr/share/javascript/$pkgname/
  cp -a ./docs/* $pkgdir/usr/share/doc/$pkgname/
  cp -a ./LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
