# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gedit-scroll-past
pkgver=0.1.0
pkgrel=1
pkgdesc="Gedit 3 plugin to allow scrolling past the end of file"
arch=("any")
url="https://github.com/hardpixel/gedit-scroll-past"
license=("GPL")
depends=("gedit")
source=("https://github.com/hardpixel/gedit-scroll-past/archive/$pkgver.tar.gz")
md5sums=("SKIP")

package() {
  mkdir -p "$pkgdir/usr/share/gedit/plugins/scroll-past"
  cp -a "$srcdir/$pkgname-$pkgver/." "$pkgdir/usr/share/gedit/plugins/scroll-past"
}

