# Maintainer: Snehit Sah <snehitsah@protonmail.com>

pkgname=ttf-chewy
pkgver=1.001
pkgrel=1
pkgdesc="A font you can really sink your teeth into. And unlike all those tasteless fonts, Chewy never loses its flavor!"
arch=('any')
license=('Apache')
url="https://github.com/google/fonts/tree/master/apache/chewy"
source=("https://github.com/google/fonts/raw/master/apache/chewy/Chewy-Regular.ttf")
md5sums=('fef0557686d2280ebe303fd3b8691efd')

package() {
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" "$srcdir/Chewy-Regular.ttf"
}
