# Maintainer: reskoldo73 <reskoldo73@gmail.com>

pkgname=ttf-tiresias
pkgver=20090804
pkgrel=8
pkgdesc="A set of free Sans Serif TrueType fonts"
arch=('any')
url="https://www.fontsquirrel.com/fonts/Tiresias-Infofont"
license=('GPL3')
source=("$pkgname.zip::https://www.fontsquirrel.com/fonts/download/Tiresias-Infofont")
sha256sums=('SKIP')

package() {
  install -d "$pkgdir"/usr/share/fonts/TTF
  install -Dm644 'RNIB License Agreement.txt' "$pkgdir"/usr/share/licenses/$pkgname/'RNIB License Agreement.txt'
  install -m644 *.ttf "$pkgdir"/usr/share/fonts/TTF/ 
}
