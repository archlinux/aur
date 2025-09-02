# Maintainer: CelDaemon <celdaemon at voidgroup dot net>
pkgname=waybar-dunst
pkgver=0.1.0
pkgrel=2
pkgdesc="Waybar module for showing dunst's paused status"
arch=(any)
url="https://github.com/CelDaemon/waybar-dunst"
license=('GPL-3.0-or-later')
depends=(python python-dbus-fast)
install="config.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/CelDaemon/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("f9feaa61b3c734bcb33568fff1c2abe944e4667e2ef88f285c2dd343db379fe5")


package() {
	cd "$pkgname-$pkgver"
	PREFIX="$pkgdir/usr" ./install.sh
}
