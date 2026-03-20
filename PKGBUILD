# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Rawleenc

pkgname=gnome-shell-extension-resource-monitor
pkgver=27
pkgrel=1
pkgdesc="Monitor the use of system resources like cpu, ram, disk, network and display them in gnome shell top bar"
arch=("any")
url="https://github.com/0ry0n/Resource_Monitor/"
license=('GPL-3.0-or-later')
depends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('6df4fb590b3b4a0eac95c30c4c25ba0863dfeb99dc036ecf19d84b03c98e98b3d2091c367b8df4623c014e369e7a3a83835cc1b44004303ef60bbbd3b700b8f7')

_srcdir="Resource_Monitor-$pkgver"

package() {
	depends+=('gnome-shell')

	install -d "$pkgdir/usr/share/gnome-shell/extensions"
	cp -a "$_srcdir/Resource_Monitor@Ory0n/." "$pkgdir/usr/share/gnome-shell/extensions/Resource_Monitor@Ory0n"
}
