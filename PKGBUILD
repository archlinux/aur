# Contributor: feufochmar <feufochmar.gd@beleth.fr>
pkgname=otf-gamaliel
pkgver=1.0
pkgrel=4
pkgdesc="Modern blackletter, inspired on the typeface of an incunable printed in Barcelona by Joan Rosembach at year 1496."
arch=('any')
url="https://fontlibrary.org/en/font/gamaliel"
license=('custom:OFL')
depends=()
source=("https://fontlibrary.org/assets/downloads/gamaliel/e0c9601992c81cd08b8d449411bc0ac6/gamaliel.zip" "OFL.txt")

package() {
  cd "$srcdir"
  install -D -m644 OFL.txt "$pkgdir"/usr/share/licenses/$pkgname/OFL
  mkdir -p  "$pkgdir"/usr/share/fonts/OTF
  install -m644 Gamaliel/Gamaliel/*.otf "$pkgdir"/usr/share/fonts/OTF/
} 
md5sums=('e0c9601992c81cd08b8d449411bc0ac6'
         'b2cd1f908e1f6e76c16f214033b3e93f')
