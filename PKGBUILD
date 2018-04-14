# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gedit-duplicate-line
pkgver=0.2.0
pkgrel=1
pkgdesc="Gedit 3 plugin to duplicate highlighted selections using Ctrl+D"
arch=("any")
url="https://github.com/hardpixel/gedit-duplicate-line"
license=("GPL")
depends=("gedit")
source=("$pkgname-$pkgver::https://github.com/hardpixel/gedit-duplicate-line/archive/$pkgver.tar.gz")
md5sums=("3836817277df65475c92415ee15adbf0")

package() {
  mkdir -p "$pkgdir/usr/lib/gedit/plugins/duplicate-line"
  cp -a "$srcdir/$pkgname-$pkgver/." "$pkgdir/usr/lib/gedit/plugins/duplicate-line"
}
