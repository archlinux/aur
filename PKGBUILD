# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gedit-strip-whitespace
pkgver=0.1.0
pkgrel=1
pkgdesc="Gedit 3 plugin to strip trailing whitespace on file save"
arch=("any")
url="https://github.com/hardpixel/gedit-strip-whitespace"
license=("GPL")
depends=("gedit")
source=("https://github.com/hardpixel/gedit-strip-whitespace/archive/$pkgver.tar.gz")
md5sums=("SKIP")

package() {
  mkdir -p "$pkgdir/usr/share/gedit/plugins/strip-whitespace"
  cp -a "$srcdir/$pkgname-$pkgver/." "$pkgdir/usr/share/gedit/plugins/strip-whitespace"
}

