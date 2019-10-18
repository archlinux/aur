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
sha256sums=('SKIP')

package() {
  install -d "$pkgdir"/usr/share/fonts/TTF
  install -Dm644 'RNIB License Agreement.txt' "$pkgdir"/usr/share/licenses/$pkgname/'RNIB License Agreement.txt'
  install -m644 *.ttf "$pkgdir"/usr/share/fonts/TTF/ 
}
