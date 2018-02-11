# Maintainer: Protesilaos Stavrou <info@protesilaos.com>

pkgname=tempus-themes-gtksourceview3
pkgver=0.2.0
pkgrel=1
pkgdesc="Tempus themes for GTK3 syntax highlighting (used in Gedit, Pluma, Xed)"
arch=('any')
depends=('gtksourceview3')
url="https://github.com/protesilaos/$pkgname"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('e07e7f8e656d808728ee6b13d40bdfc53948ebd487f1591d4a66dd05779d316c249da3b7b1624f9daeac0475b204de732ea1d772e5bf5fa08f0cc06ab7aa4760')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  install -dm 755 "$pkgdir/usr/share/gtksourceview-3.0/styles/"
  install -Dm 644 *.xml \
    "$pkgdir/usr/share/gtksourceview-3.0/styles/"
}
