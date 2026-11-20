# Maintainer: Nathan Doyle <582149+Natetronn@users.noreply.github.com>

pkgname=waydroid-tray
pkgver=0.1.0
pkgrel=1
pkgdesc="KDE Plasma system tray launcher for Waydroid apps and sessions"
arch=('any')
url="https://github.com/Natetronn/waydroid-tray"
license=('MIT')
depends=('waydroid' 'python' 'pyside6' 'kstatusnotifieritem' 'knotifications')
optdepends=('breeze-icons: monochrome tray icon that follows the panel colors')
install=waydroid-tray.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('de0f281aaf67fcf719c2064ec6497c981ed05b54241d1ceb26d233fdcdeec83f')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
