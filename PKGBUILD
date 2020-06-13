# Contributor: feufochmar <feufochmar.gd@beleth.fr>
pkgname=ttf-eadui
pkgver=1.2
pkgrel=4
pkgdesc="A script font based on the hand of a famous eleventh-century scribe."
arch=('any')
url="http://openfontlibrary.org/en/font/eadui"
license=('custom:OFL')
depends=()
source=("http://openfontlibrary.org/assets/downloads/eadui/f7b140ad037eb65f4e1d3ba9d8a36515/eadui.zip")

package() {
  cd "$srcdir"
  bsdtar -x -f eaduifill.zip
  mkdir -p  "$pkgdir"/usr/share/fonts/TTF
  install -m644 *.ttf "$pkgdir"/usr/share/fonts/TTF/
}
md5sums=('f7b140ad037eb65f4e1d3ba9d8a36515')
