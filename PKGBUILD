# Contributor: feufochmar <feufochmar@d-20.fr>
pkgname=ttf-eadui
pkgver=1.2
pkgrel=2
pkgdesc="A script font based on the hand of a famous eleventh-century scribe."
arch=('any')
url="http://openfontlibrary.org/font/eadui"
license=('custom:OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=eadui.install
source=("http://openfontlibrary.org/assets/downloads/eadui/f7b140ad037eb65f4e1d3ba9d8a36515/eadui.zip")

package() {
  cd "$srcdir"
  bsdtar -x -f eaduifill.zip
  mkdir -p  "$pkgdir"/usr/share/fonts/TTF
  install -m644 *.ttf "$pkgdir"/usr/share/fonts/TTF/
}
md5sums=('f7b140ad037eb65f4e1d3ba9d8a36515')
