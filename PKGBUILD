# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gedit-dark-variant
pkgver=0.1.0
pkgrel=2
pkgdesc="Gedit 3 plugin to enable the theme's dark variant"
arch=("any")
url="https://github.com/hardpixel/gedit-dark-variant"
license=("GPL")
depends=("gedit")
source=("https://github.com/hardpixel/gedit-dark-variant/archive/$pkgver.tar.gz")
md5sums=("SKIP")

package() {
  mkdir -p "$pkgdir/usr/lib/gedit/plugins/dark-variant"
  cp -a "$srcdir/$pkgname-$pkgver/." "$pkgdir/usr/lib/gedit/plugins/dark-variant"
}

