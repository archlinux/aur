# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Rawleenc

pkgname=gnome-shell-extension-resource-monitor
pkgver=26
pkgrel=1
pkgdesc="Monitor the use of system resources like cpu, ram, disk, network and display them in gnome shell top bar"
arch=("any")
url="https://github.com/0ry0n/Resource_Monitor/"
license=('GPL-3.0-or-later')
depends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('c560153c8fc2237971ceb352c1a1f67d271d69f8517ef737b89603bfa7c918b0834ba25cc50b03102ea6f5df32dbf8f863594be8739d519d06e69b537d8c10e0')

_srcdir="Resource_Monitor-$pkgver"

package() {
	depends+=('gnome-shell')

	install -d "$pkgdir/usr/share/gnome-shell/extensions"
	cp -a "$_srcdir/Resource_Monitor@Ory0n/." "$pkgdir/usr/share/gnome-shell/extensions/Resource_Monitor@Ory0n"
}
