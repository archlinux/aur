# Maintainer: Christoph Hoopmann (choopm) <choopm at 0pointer.org>

pkgname=sony-sketch-ef-font
pkgver=2.0.5
pkgrel=2
pkgdesc="Sony Sketch EF Font"
arch=('any')
url="http://www.ffonts.net/Sony-Sketch-EF.font"
license=('unknown')
depends=('fontconfig' 'unzip')
install=sony-sketch-ef-font.install
_file="Sony-Sketch-EF.font.zip"
source=("http://www.ffonts.net/$_file")
sha256sums=('b20ac9acc0506a1b7e079ace5aa4d5f0868bb3b5cdf5f4016747c958cb682bd6')

build() {
  true
}

package() {
  cd "$srcdir/"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 Sony_Sketch_EF.ttf "$pkgdir/usr/share/fonts/TTF/"
}

# vim:set ts=2 sw=2 et:
