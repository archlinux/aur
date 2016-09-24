# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gedit-duplicate-line
pkgver=0.1.0
pkgrel=1
pkgdesc="Gedit 3 plugin to duplicate highlighted selections using Ctrl+D"
arch=("any")
url="https://github.com/hardpixel/gedit-duplicate-line"
license=("GPL")
depends=("gedit")
source=("https://github.com/hardpixel/gedit-duplicate-line/archive/$pkgver.tar.gz")
md5sums=("SKIP")

package() {
  mkdir -p "$pkgdir/usr/share/gedit/plugins/duplicate-line"
  cp -a "$srcdir/$pkgname-$pkgver/." "$pkgdir/usr/share/gedit/plugins/duplicate-line"
}

