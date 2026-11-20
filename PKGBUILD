# Maintainer: Nathan Doyle <582149+Natetronn@users.noreply.github.com>

pkgname=ghostty-tray
pkgver=0.1.4
pkgrel=1
pkgdesc="KDE Plasma system tray launcher for Ghostty with profiles and quick terminal toggle"
arch=('any')
url="https://github.com/Natetronn/ghostty-tray"
license=('MIT')
depends=('ghostty' 'python' 'python-dbus' 'python-pyqt6')
optdepends=('breeze-icons: monochrome tray icon that follows the panel colors')
install=ghostty-tray.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('85931b98124d191c1083ff0f13b941e176222a02f9e0afd5081cd2f41cf54610')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
