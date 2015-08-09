# Contributor : Damir Perisa <damir.perisa@bluewin.ch>
# Maintainer: dale <dale@archlinux.org>
# Contributor: bender02 at gmx dot com

pkgname=fortune-mod-calvin
pkgver=0.3
pkgrel=1
pkgdesc="Calvin and Hobbes fortune cookies"
url="http://www.netmeister.org/misc.html"
arch=('any')
license=('unknown')
depends=('fortune-mod')
source=(http://www.netmeister.org/apps/fortunes-calvin-$pkgver.gz)
md5sums=('4de37b645ea879f4042df8f88c215b35')

build() {
  cd "$srcdir"
  strfile fortunes-calvin-$pkgver
}

package() {
  install -Dm644 "$srcdir/fortunes-calvin-$pkgver" "$pkgdir/usr/share/fortune/calvin"
  install -Dm644 "$srcdir/fortunes-calvin-$pkgver.dat" "$pkgdir/usr/share/fortune/calvin.dat"
}

