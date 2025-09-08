# Maintainer: CelDaemon <celdaemon at voidgroup dot net>
pkgname=waybar-dunst
pkgver=0.2.2
pkgrel=1
pkgdesc="Waybar module for showing dunst's paused status"
arch=(any)
url="https://github.com/CelDaemon/waybar-dunst"
license=('GPL-3.0-or-later')
depends=(python python-dbus-fast)
install="config.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/CelDaemon/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9a2d6a1cbe9e6820a45b4e9a064d24a06ff9fb8eb7a81b748c6684560da4dcef')


package() {
	cd "$pkgname-$pkgver"
	PREFIX="$pkgdir/usr" ./install.sh
}
