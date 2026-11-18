# Maintainer: Nathan Doyle <582149+Natetronn@users.noreply.github.com>

pkgname=ghostty-tray
pkgver=0.1.0
pkgrel=1
pkgdesc="KDE Plasma system tray launcher for Ghostty with profiles and quick terminal toggle"
arch=('any')
url="https://github.com/Natetronn/ghostty-tray"
license=('MIT')
depends=('ghostty' 'python' 'python-dbus' 'python-pyqt6' 'systemd')
optdepends=('breeze-icons: monochrome tray icon that follows the panel colors')
install=ghostty-tray.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0c411d248298f5049ba5fea65bf4f9c3deb2974da11930622e5b9b9008889740')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
