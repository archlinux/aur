# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=zapzap-bin
pkgver=7.0.3
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
source=("https://github.com/Felitendo/PKGBUILDS/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.zst")
sha256sums=('73e5415a7de9b6e3d7d3f8760c23ad3fec901a48e714d964f54293845804e3c8')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
