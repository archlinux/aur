pkgname=prayerapp
pkgdesc="Simple and light-weight app for prayer time reminders."
pkgver=1.4
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/tgharib/PrayerApp"
license=('GPL3')
source=(https://github.com/tgharib/PrayerApp/releases/download/v$pkgver/PrayerApp.jar
	PrayerApp.desktop
	trayicon.jpg
	PrayerAppConfig.ini)
md5sums=('SKIP'
	'SKIP'
	'SKIP'
	'SKIP')
depends=('jre8-openjdk')

package() {
	install -D $srcdir/PrayerApp.desktop ${pkgdir}/usr/share/applications/PrayerApp.desktop
	install -D $srcdir/trayicon.jpg $pkgdir/opt/prayerapp/trayicon.jpg
	install -D $srcdir/PrayerAppConfig.ini $pkgdir/opt/prayerapp/PrayerAppConfig.ini
	install -D $srcdir/PrayerApp.jar $pkgdir/opt/prayerapp/PrayerApp.jar
}
