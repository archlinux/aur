# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gedit-panel-toggler
pkgver=0.1.0
pkgrel=1
pkgdesc="Gedit 3 plugin to toggle side and bottom panels using buttons in header bar"
arch=("any")
url="https://github.com/hardpixel/gedit-panel-toggler"
license=("GPL")
depends=("gedit")
source=("https://github.com/hardpixel/gedit-panel-toggler/archive/$pkgver.tar.gz")
md5sums=("SKIP")

package() {
  mkdir -p "$pkgdir/usr/share/gedit/plugins/panel-toggler"
  cp -a "$srcdir/$pkgname-$pkgver/." "$pkgdir/usr/share/gedit/plugins/panel-toggler"
}

