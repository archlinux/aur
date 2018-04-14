# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gedit-cut-line
pkgver=0.2.0
pkgrel=1
pkgdesc="Gedit 3 plugin to cut lines using Ctrl+X"
arch=("any")
url="https://github.com/hardpixel/gedit-cut-line"
license=("GPL")
depends=("gedit")
source=("$pkgname-$pkgver::https://github.com/hardpixel/gedit-cut-line/archive/$pkgver.tar.gz")
md5sums=("255476ae267324d76e36aa718b5ea349")

package() {
  mkdir -p "$pkgdir/usr/lib/gedit/plugins/cut-line"
  cp -a "$srcdir/$pkgname-$pkgver/." "$pkgdir/usr/lib/gedit/plugins/cut-line"
}
