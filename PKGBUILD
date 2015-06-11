# Contributor: feufochmar <feufochmar@d-20.fr>
pkgname=otf-gamaliel
pkgver=1.0
pkgrel=2
pkgdesc="Modern blackletter, inspired on the typeface of an incunable printed in Barcelona by Joan Rosembach at year 1496."
arch=('any')
url="http://sid.ethz.ch/debian/ttf-gamaliel"
license=('custom:OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=gamaliel.install
source=("http://sid.ethz.ch/debian/ttf-gamaliel/Gamaliel.otf" "OFL.txt")

package() {
  cd "$srcdir"
  install -D -m644 OFL.txt "$pkgdir"/usr/share/licenses/$pkgname/OFL
  mkdir -p  "$pkgdir"/usr/share/fonts/OTF
  install -m644 *.otf "$pkgdir"/usr/share/fonts/OTF/
} 
md5sums=('252299ad933b2acb62e561c828c86f75'
         'b2cd1f908e1f6e76c16f214033b3e93f')
