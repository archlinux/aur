# Maintainer: Protesilaos Stavrou <info@protesilaos.com>

pkgname=tempus-themes-gtksourceview3
pkgver=0.3.0
pkgrel=1
pkgdesc="Tempus themes for GTK3 syntax highlighting (used in Gedit, Pluma, Xed)"
arch=('any')
depends=('gtksourceview3')
url="https://github.com/protesilaos/$pkgname"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('00a82e70c2a99186e4e66de5e502be74da8f3899639299f2d3b62b8c9aa4c443d1d1c19a896fdd0d863df4b6b89f2e4465ab48ab7d31ae29e6e59ebf7ee95dac')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  install -dm 755 "$pkgdir/usr/share/gtksourceview-3.0/styles/"
  install -Dm 644 *.xml \
    "$pkgdir/usr/share/gtksourceview-3.0/styles/"
}
