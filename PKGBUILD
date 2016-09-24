# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gedit-smart-home
pkgver=0.1.0
pkgrel=1
pkgdesc="Gedit 3 plugin to go to the first character instead of the start of the line using Home"
arch=("any")
url="https://github.com/hardpixel/gedit-smart-home"
license=("GPL")
depends=("gedit")
source=("https://github.com/hardpixel/gedit-smart-home/archive/$pkgver.tar.gz")
md5sums=("SKIP")

package() {
  mkdir -p "$pkgdir/usr/share/gedit/plugins/smart-home"
  cp -a "$srcdir/$pkgname-$pkgver/." "$pkgdir/usr/share/gedit/plugins/smart-home"
}

