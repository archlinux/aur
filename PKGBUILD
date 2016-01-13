# Maintainer: Christoph Hoopmann (choopm) <choopm at 0pointer.org>

pkgname=sony-sketch-ef-font
pkgver=2.0.5
pkgrel=1
pkgdesc="Sony Sketch EF Font"
arch=('any')
url="http://www.ffonts.net/Sony-Sketch-EF.font"
license=('unknown')
depends=('fontconfig' 'unzip')
install=sony-sketch-ef-font.install
_file="Sony-Sketch-EF.font.zip"
source=("http://www.ffonts.net/$_file")
sha256sums=('b26cb1fdeaae9c284a95a31f7db06604b58c7993741b7358a2032a262f00e4f7')

build() {
  true
}

package() {
  cd "$srcdir/"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 Sony_Sketch_EF.ttf "$pkgdir/usr/share/fonts/TTF/"
}

# vim:set ts=2 sw=2 et:
