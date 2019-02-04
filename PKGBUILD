# Contributor: feufochmar <guill.delacourt@gmail.com>
pkgname=ttf-caracteres
pkgver=1.0
pkgrel=3
pkgdesc="A family of typefaces used on roadsigns in France."
arch=('any')
url="http://fonts.simplythebest.net/font/367/caracteres-font.font"
license=('custom')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=("http://fonts.simplythebest.net/fonts/download=367")

package() {
  cd "$srcdir/"
  mkdir -p  "$pkgdir"/usr/share/fonts/TTF
  install -m644 *.ttf "$pkgdir"/usr/share/fonts/TTF/
}

md5sums=('22d9ae4cb9e04680e879e4c2850e471f')
