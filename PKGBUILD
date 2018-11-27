# Maintainer: Thayne McCombs <astrothayne at gmail dot com>
pkgname=somenu
pkgver=0.1.1
pkgrel=1
pkgdesc="Standalone Gtk Menu"
arch=(any)
url="https://github.com/"
license=('GPL3')
depends=(python python-gobject gnome-menus gtk3)
source=("https://github.com/tmccombs/${pkgname}/archive/v${pkgver}.tar.gz")


package() {
	cd "$pkgname-$pkgver"
  install -m 755 -D somenu.py "$pkgdir/usr/bin/somenu"
}
md5sums=('9ad42134730279fbb6852737e2df6aef')
