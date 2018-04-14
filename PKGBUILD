# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gedit-scroll-past
pkgver=0.2.0
pkgrel=1
pkgdesc="Gedit 3 plugin to allow scrolling past the end of file"
arch=("any")
url="https://github.com/hardpixel/gedit-scroll-past"
license=("GPL")
depends=("gedit")
source=("$pkgname-$pkgver::https://github.com/hardpixel/gedit-scroll-past/archive/$pkgver.tar.gz")
md5sums=("c3e5abaa7686ddb4f0555afcf1565b45")

package() {
  mkdir -p "$pkgdir/usr/lib/gedit/plugins/scroll-past"
  cp -a "$srcdir/$pkgname-$pkgver/." "$pkgdir/usr/lib/gedit/plugins/scroll-past"
}
