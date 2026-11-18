# Maintainer: Nathan Doyle <582149+Natetronn@users.noreply.github.com>

pkgname=ghostty-tray
pkgver=0.1.2
pkgrel=2
pkgdesc="KDE Plasma system tray launcher for Ghostty with profiles and quick terminal toggle"
arch=('any')
url="https://github.com/Natetronn/ghostty-tray"
license=('MIT')
depends=('ghostty' 'python' 'python-dbus' 'python-pyqt6')
optdepends=('breeze-icons: monochrome tray icon that follows the panel colors')
install=ghostty-tray.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6726291a485c42bac5e0fa54eafda6672f2f372cb4627fbdf62514273d741e21')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
