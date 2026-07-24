# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=timetable-bin
pkgver=4.2.1
pkgrel=1
pkgdesc="GTK4 + LibAdwaita client for WebUntis (prebuilt)"
arch=('any')
url="https://codeberg.org/ostfriese4/untis"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'webkitgtk-6.0' 'libsecret' 'python' 'python-gobject'
         'python-requests' 'python-pyotp' 'glib2' 'hicolor-icon-theme')
provides=('untis' 'timetable')
conflicts=('untis' 'timetable')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.zst::https://github.com/Felitendo/PKGBUILDS/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.zst")
sha256sums=('c68179716fdb5eb6268203168207a1ea7d03a75456c00de38d152dc6098bd0dc')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
