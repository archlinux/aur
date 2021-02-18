# Maintainer: Edin Veskovic <edin.lockedin@gmail.com>
pkgname=xfce4-weather-plugin-circle-icons
pkgver=0.2
pkgrel=2
pkgdesc="Flat-circle icons for xfce4-weather-plugin"
arch=('any')
url="https://github.com/schizo-ri/circle-icons-for-xfce-weather"
license=('CC0 1.0 Universal')
source=('https://github.com/schizo-ri/circle-icons-for-xfce-weather/archive/0.2.zip')
md5sums=('b94d24e1a8fb660b0c0a682b8c4cac2c')
sha256sums=('0da96d8f9891f86fbe545101426ad169d43476aba82b276be9f9a25c5b87c8e1')
makedepends=()

package() {
  mkdir -p "$pkgdir/usr/share/xfce4/weather/icons/flat-circle"
   
  cp -Rf $srcdir/circle-icons-for-xfce-weather-0.2/icons/* "$pkgdir/usr/share/xfce4/weather/icons/flat-circle/"
}
