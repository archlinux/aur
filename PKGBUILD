# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>

pkgname=plasma5-applets-eventcalendar
pkgver=53
pkgrel=1
pkgdesc="Plasmoid for Plasma 5. An extended calendar with daily weather forecasts and events from Google Calendar."
arch=('any')
url="https://store.kde.org/p/998901/"
license=('GPL')
depends=('plasma-workspace' 'qt5-graphicaleffects')
source=("https://github.com/Zren/plasma-applet-eventcalendar/archive/eventcalendar-$pkgver.tar.gz")
md5sums=('91abd9b8cc6f7e8118cc851eedd4e025')

package() {
  cd plasma-applet-eventcalendar-eventcalendar-$pkgver/package
  
  mkdir -p $pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.eventcalendar
  cp -r * $pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.eventcalendar
}
