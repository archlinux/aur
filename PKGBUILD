# Submitter: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Maintainer: Zren <zrenfire@gmail.com>

pkgname=plasma5-applets-eventcalendar
pkgver=61
pkgrel=1
pkgdesc="An extended calendar plasmoid with daily weather forecasts and events from Google Calendar. Also includes a timer and 24 hour forecast graph."
arch=('any')
url="https://store.kde.org/p/998901/"
license=('GPL')
depends=('plasma-workspace' 'qt5-graphicaleffects')
source=("https://github.com/Zren/plasma-applet-eventcalendar/archive/v$pkgver.tar.gz")
md5sums=('dcfb8d28dd8e593e8b87604da5107a2c')

package() {
    cd plasma-applet-eventcalendar-$pkgver/package

    mkdir -p $pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.eventcalendar
    cp -r * $pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.eventcalendar
}
