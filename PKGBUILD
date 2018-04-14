# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gedit-panel-toggler
pkgver=0.2.0
pkgrel=1
pkgdesc="Gedit 3 plugin to toggle side and bottom panels using buttons in header bar"
arch=("any")
url="https://github.com/hardpixel/gedit-panel-toggler"
license=("GPL")
depends=("gedit")
source=("$pkgname-$pkgver::https://github.com/hardpixel/gedit-panel-toggler/archive/$pkgver.tar.gz")
md5sums=("5722f7213f2b69b0ea3488c8a4794a44")

package() {
  mkdir -p "$pkgdir/usr/lib/gedit/plugins/panel-toggler"
  cp -a "$srcdir/$pkgname-$pkgver/." "$pkgdir/usr/lib/gedit/plugins/panel-toggler"
}
