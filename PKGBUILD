# Maintainer: Protesilaos Stavrou <info@protesilaos.com>

pkgname=tempus-themes-gtksourceview3
pkgver=0.1.0
pkgrel=1
pkgdesc="Tempus themes for GTK3 syntax highlighting (used in Gedit, Pluma, Xed)"
arch=('any')
depends=('gtksourceview3')
url="https://github.com/protesilaos/$pkgname"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::https://github.com/protesilaos/$pkgname/archive/$pkgver.tar.gz)
sha512sums=('db49024f0ded89016676ae78feb9d24fbf6d6b8d3b1203969a97ee73d203f36c9f1e8a387852634aa56a1a347e54a9d6da44d06927e9e40b31c1d001386b2466')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  install -dm 755 "$pkgdir/usr/share/gtksourceview-3.0/styles/"
  install -Dm 644 *.xml \
    "$pkgdir/usr/share/gtksourceview-3.0/styles/"
}
