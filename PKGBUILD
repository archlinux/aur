# Maintainer: Protesilaos Stavrou <info@protesilaos.com>

pkgname=tempus-themes-gtksourceview3
pkgver=0.4.0
pkgrel=1
pkgdesc="Tempus themes for GTK3 syntax highlighting (used in Gedit, Pluma, Xed)"
arch=('any')
depends=('gtksourceview3')
url="https://github.com/protesilaos/$pkgname"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('c05fcee3dc577b2b8393573431f0c3dc713b8b6d47511d7391cc4ddb759aa36eaeb65d587242806b1e0397d37677348fceb25bb5d625bc8934e1c3e7ae0f4dc4')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  install -dm 755 "$pkgdir/usr/share/gtksourceview-3.0/styles/"
  install -Dm 644 *.xml \
    "$pkgdir/usr/share/gtksourceview-3.0/styles/"
}
