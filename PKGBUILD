# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>

pkgname=plasma5-applets-eventcalendar
pkgver=42
pkgrel=1
pkgdesc="Plasmoid for Plasma 5. An extended calendar with daily weather forecasts and events from Google Calendar."
arch=('any')
url="https://www.kde-look.org/p/998901/"
license=('GPL')
depends=('plasma-workspace' 'qt5-graphicaleffects')
source=("https://github.com/Zren/plasma-applets/archive/eventcalendar-$pkgver.tar.gz")
md5sums=('c7bd6df76f1e6ad990a9a812867baf26')

package() {
  cd $srcdir/plasma-applets-eventcalendar-$pkgver/org.kde.plasma.eventcalendar/package
  
  mkdir -p $pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.eventcalendar
  cp -r * $pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.eventcalendar
}
