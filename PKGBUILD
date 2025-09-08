# Maintainer: CelDaemon <celdaemon at voidgroup dot net>
pkgname=waybar-dunst
pkgver=0.2.0
pkgrel=1
pkgdesc="Waybar module for showing dunst's paused status"
arch=(any)
url="https://github.com/CelDaemon/waybar-dunst"
license=('GPL-3.0-or-later')
depends=(python python-dbus-fast)
install="config.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/CelDaemon/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d008a57bfe5e87a316d458197fb89bfa6d82a128105f2845612be5c0c40f0cff')


package() {
	cd "$pkgname-$pkgver"
	PREFIX="$pkgdir/usr" ./install.sh
}
