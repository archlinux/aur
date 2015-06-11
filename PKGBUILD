# Contributor: feufochmar <feufochmar@d-20.fr>
pkgname=otf-miama
pkgver=1.0
pkgrel=4
pkgdesc="A calligraphic font."
arch=('any')
url="http://www.dafont.com/fr/miama.font"
license=('custom:OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=miama.install
source=("http://img.dafont.com/dl/?f=miama")

package() {
  cd "$srcdir"
  install -D -m644 license.txt "$pkgdir"/usr/share/licenses/$pkgname/OFL
  mkdir -p  "$pkgdir"/usr/share/fonts/OTF
  install -m644 *.otf "$pkgdir"/usr/share/fonts/OTF/
}

md5sums=('cb31fce0104b8f2d3881900a73aaad6e')
