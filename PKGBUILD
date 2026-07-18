# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=timetable-bin
pkgver=4.1
pkgrel=1
pkgdesc="GTK4 + LibAdwaita client for WebUntis (prebuilt)"
arch=('any')
url="https://codeberg.org/ostfriese4/untis"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'webkitgtk-6.0' 'libsecret' 'python' 'python-gobject'
         'python-requests' 'python-pyotp' 'glib2' 'hicolor-icon-theme')
provides=('untis' 'timetable')
conflicts=('untis' 'timetable')
source=("https://github.com/Felitendo/PKGBUILDS/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.zst")
sha256sums=('cfbebefbbdb7d7216f999a2171633a8684d008ee12a9fea047f581006bca9c4e')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
