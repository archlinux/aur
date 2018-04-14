# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gedit-dark-variant
pkgver=0.2.0
pkgrel=1
pkgdesc="Gedit 3 plugin to enable the theme's dark variant"
arch=("any")
url="https://github.com/hardpixel/gedit-dark-variant"
license=("GPL")
depends=("gedit")
source=("$pkgname-$pkgver::https://github.com/hardpixel/gedit-dark-variant/archive/$pkgver.tar.gz")
md5sums=("60bb3cf0eb9f84c4f263f8092f87a3c8")

package() {
  mkdir -p "$pkgdir/usr/lib/gedit/plugins/dark-variant"
  cp -a "$srcdir/$pkgname-$pkgver/." "$pkgdir/usr/lib/gedit/plugins/dark-variant"
}
