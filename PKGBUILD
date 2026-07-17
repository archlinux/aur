# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=timetable-bin
pkgver=3.1
pkgrel=1
pkgdesc="GTK4 + LibAdwaita client for WebUntis (prebuilt, bundles python-webuntis)"
arch=('any')
url="https://codeberg.org/ostfriese4/untis"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'python' 'python-gobject' 'python-requests' 'glib2' 'hicolor-icon-theme')
provides=('untis' 'timetable')
conflicts=('untis' 'timetable')
source=("https://github.com/Felitendo/PKGBUILDS/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.zst")
sha256sums=('ffd735d1a08204fe18e563815813b3a62f7625bce5bd5d4c086f1456422e0590')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
