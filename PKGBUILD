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
sha256sums=("adcaf0cd424fb8187afbba52a75adad71d948931d5e51c97cc6804c8c41b1a72")


package() {
	cd "$pkgname-$pkgver"
	PREFIX="$pkgdir/usr" ./install.sh
}
