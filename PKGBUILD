# Maintainer: Thayne McCombs <astrothayne at gmail dot com>
pkgname=somenu
pkgver=0.1.2
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
md5sums=('eab2664ca638db1b6bc836cc899d8041')
