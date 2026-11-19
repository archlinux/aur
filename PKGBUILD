# Maintainer: Nathan Doyle <582149+Natetronn@users.noreply.github.com>

pkgname=ghostty-tray
pkgver=0.1.3
pkgrel=1
pkgdesc="KDE Plasma system tray launcher for Ghostty with profiles and quick terminal toggle"
arch=('any')
url="https://github.com/Natetronn/ghostty-tray"
license=('MIT')
depends=('ghostty' 'python' 'python-dbus' 'python-pyqt6')
optdepends=('breeze-icons: monochrome tray icon that follows the panel colors')
install=ghostty-tray.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fb40bfc10599e5f1c9b68a966cda7d1f521e6011865e6642589439ec52903ec4')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
