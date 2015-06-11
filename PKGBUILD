# Contributor: feufochmar <guill.delacourt@gmail.com>
pkgname=ttf-caracteres
pkgver=1.0
pkgrel=2
pkgdesc="A family of typefaces used on roadsigns in France."
arch=('any')
url="http://simplythebest.net/fonts/fonts/caracteres.html"
license=('custom')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=caracteres.install
source=("http://simplythebest.net/fonts/fonts/download=367")

package() {
  cd "$srcdir/"
  mkdir -p  "$pkgdir"/usr/share/fonts/TTF
  install -m644 *.ttf "$pkgdir"/usr/share/fonts/TTF/
}

md5sums=('22d9ae4cb9e04680e879e4c2850e471f')
