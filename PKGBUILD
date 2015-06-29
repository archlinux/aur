
# Maintainer: Edin Veskovic <edin.veskovic@openmailbox.org>

pkgname=xfce4-weather-plugin-circle-icons
pkgver=0.2
pkgrel=1
pkgdesc="Flat-circle icons for xfce4-weather-plugin"
arch=('any')
url="https://github.com/schizo-ri/circle-icons-for-xfce-weather"
license=('CC0 1.0 Universal')
source=('https://github.com/schizo-ri/circle-icons-for-xfce-weather/archive/0.2.zip')
md5sums=('9ff84294c051dc6afc0b71d2896aded7')
sha256sums=('63c1c3bbfcaab9866372fd52dbfb6854a039b43f913053949c1e15dbc826949f')
makedepends=()

package() {
  mkdir -p "$pkgdir/usr/share/xfce4/weather/icons/flat-circle"
   
  cp -Rf $srcdir/circle-icons-for-xfce-weather-0.2/icons/* "$pkgdir/usr/share/xfce4/weather/icons/flat-circle/"
}
