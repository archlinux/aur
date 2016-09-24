# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gedit-cut-line
pkgver=0.1.0
pkgrel=1
pkgdesc="Gedit 3 plugin to cut lines using Ctrl+X"
arch=("any")
url="https://github.com/hardpixel/gedit-cut-line"
license=("GPL")
depends=("gedit")
source=("https://github.com/hardpixel/gedit-cut-line/archive/$pkgver.tar.gz")
md5sums=("SKIP")

package() {
  mkdir -p "$pkgdir/usr/share/gedit/plugins/cut-line"
  cp -a "$srcdir/$pkgname-$pkgver/." "$pkgdir/usr/share/gedit/plugins/cut-line"
}

