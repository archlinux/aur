# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=waydroid-helper-bin
pkgver=0.2.9
pkgrel=1
pkgdesc="GUI application for Waydroid configuration and extension installation (prebuilt)"
arch=('any')
url="https://github.com/ayasa520/waydroid-helper"
license=('GPL-3.0-or-later')
depends=('python' 'fakeroot' 'python-bidict' 'python-httpx' 'python-gobject'
         'python-yaml' 'python-pywayland' 'python-cairo' 'gtk4' 'libadwaita'
         'python-aiofiles' 'python-dbus' 'android-tools' 'vte4'
         'hicolor-icon-theme')
optdepends=('bindfs: shared folders support'
            'waydroid: the container this tool configures')
provides=('waydroid-helper')
conflicts=('waydroid-helper')
source=("https://github.com/Felitendo/PKGBUILDS/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.zst")
sha256sums=('8a02695c6a3f102d1fa2a0b6266bb1978874338eac5a33b3391ada3243c01e56')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
