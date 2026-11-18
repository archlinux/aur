# Maintainer: Nathan Doyle <582149+Natetronn@users.noreply.github.com>

pkgname=ghostty-tray
pkgver=0.1.1
pkgrel=1
pkgdesc="KDE Plasma system tray launcher for Ghostty with profiles and quick terminal toggle"
arch=('any')
url="https://github.com/Natetronn/ghostty-tray"
license=('MIT')
depends=('ghostty' 'python' 'python-dbus' 'python-pyqt6' 'systemd')
optdepends=('breeze-icons: monochrome tray icon that follows the panel colors')
install=ghostty-tray.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('37ef568b294cfbc4c24a207141563d365aefd320c5b8993e9c7bf84da3e51855')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
