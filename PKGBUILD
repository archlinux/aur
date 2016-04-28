# Maintainer: Omid Mottaghi Rad <omidmr at gmail dot com>

pkgname=gnome-shell-extension-persian-calendar
pkgver=20160428
pkgrel=1
pkgdesc="Persian calendar for Gnome Shell."
arch=(any)
url="https://github.com/omid/Persian-Calendar-for-Gnome-Shell"
license=(GPL3)
depends=('gnome-shell>=3.20')
makedepends=(git)
install='gnome-shell-extension.install'
source=("$pkgname"::"git+https://github.com/omid/Persian-Calendar-for-Gnome-Shell")
sha256sums=('SKIP')

package() {
	install -dm755 "$srcdir/$pkgname" $pkgdir/usr/share/gnome-shell/extensions/
	cp -r "$srcdir/$pkgname" $pkgdir/usr/share/gnome-shell/extensions/
	mv $pkgdir/usr/share/gnome-shell/extensions/gnome-shell-extension-persian-calendar $pkgdir/usr/share/gnome-shell/extensions/PersianCalendar@oxygenws.com
	rm -rf $pkgdir/usr/share/gnome-shell/extensions/PersianCalendar@oxygenws.com/.git
}
