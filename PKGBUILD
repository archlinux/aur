# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ttf-tiresias
pkgver=20090804
pkgrel=4
pkgdesc="A set of free Sans Serif TrueType fonts"
arch=('any')
url="https://www.fontsquirrel.com/fonts/Tiresias-Infofont"
license=('GPL3')
depends=('fontconfig' 'xorg-font-utils')
source=(https://www.fontsquirrel.com/fonts/download/Tiresias-Infofont)
sha256sums=('ca3c4a73cdefd7753ee8d3fa9b027886f68a4ff893d6e16e665bf1b3305a44f8')

package() {
  install -d "$pkgdir"/usr/share/fonts/TTF
  install -Dm644 'RNIB License Agreement.txt' "$pkgdir"/usr/share/licenses/$pkgname/'RNIB License Agreement.txt'
  install -m644 *.ttf "$pkgdir"/usr/share/fonts/TTF/ 
}
