# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gedit-strip-whitespace
pkgver=0.2.0
pkgrel=1
pkgdesc="Gedit 3 plugin to strip trailing whitespace on file save"
arch=("any")
url="https://github.com/hardpixel/gedit-strip-whitespace"
license=("GPL")
depends=("gedit")
source=("$pkgname-$pkgver::https://github.com/hardpixel/gedit-strip-whitespace/archive/$pkgver.tar.gz")
md5sums=("632a404c89bbebca1b66cba2604f0204")

package() {
  mkdir -p "$pkgdir/usr/lib/gedit/plugins/strip-whitespace"
  cp -a "$srcdir/$pkgname-$pkgver/." "$pkgdir/usr/lib/gedit/plugins/strip-whitespace"
}
