# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=zapzap-bin
pkgver=7.1
pkgrel=1
pkgdesc="WhatsApp desktop client written in PyQt6 + PyQt6-WebEngine (prebuilt)"
arch=('any')
url="https://github.com/rafatosta/zapzap"
license=('GPL-3.0-or-later')
depends=('python' 'python-pyqt6' 'python-pyqt6-webengine' 'python-dbus'
         'qt6-wayland')
optdepends=('hunspell: spell check')
provides=('zapzap')
conflicts=('zapzap')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.zst::https://github.com/Felitendo/PKGBUILDS/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.zst")
sha256sums=('0bfbdb0c034416e6f88751ddd2aa91a7ae41d61a2f32fc3c3676fa6d86fb0b72')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
