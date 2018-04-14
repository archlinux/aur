# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gedit-smart-home
pkgver=0.2.0
pkgrel=1
pkgdesc="Gedit 3 plugin to go to the first character instead of the start of the line using Home"
arch=("any")
url="https://github.com/hardpixel/gedit-smart-home"
license=("GPL")
depends=("gedit")
source=("$pkgname-$pkgver::https://github.com/hardpixel/gedit-smart-home/archive/$pkgver.tar.gz")
md5sums=("c64d749a8778e58933362164c6386367")

package() {
  mkdir -p "$pkgdir/usr/lib/gedit/plugins/smart-home"
  cp -a "$srcdir/$pkgname-$pkgver/." "$pkgdir/usr/lib/gedit/plugins/smart-home"
}
