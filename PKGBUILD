# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=timetable-bin
pkgver=4.0
pkgrel=1
pkgdesc="GTK4 + LibAdwaita client for WebUntis (prebuilt, bundles python-webuntis)"
arch=('any')
url="https://codeberg.org/ostfriese4/untis"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'python' 'python-gobject' 'python-requests' 'glib2' 'hicolor-icon-theme')
provides=('untis' 'timetable')
conflicts=('untis' 'timetable')
source=("https://github.com/Felitendo/PKGBUILDS/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.zst")
sha256sums=('8a06f3fdfcce14b8d78a312225f731d81c1592ba6d856dc5f4992cc8bbad0e62')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
