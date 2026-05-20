# Maintainer: reskoldo73 <reskoldo73@gmail.com>

pkgname=ttf-tiresias
pkgver=20090804
pkgrel=7
pkgdesc="A set of free Sans Serif TrueType fonts"
arch=('any')
url="https://www.fontsquirrel.com/fonts/Tiresias-Infofont"
license=('GPL3')
DLAGENTS=('https::/usr/bin/curl -A "Mozilla/5.0" -fLC - --retry 3 --retry-delay 3 -o %o %u')
source=("$pkgname.zip::https://www.fontsquirrel.com/fonts/download/Tiresias-Infofont")
sha256sums=('b65a90a9109aaaa36656e705d03101dd777743247e76e89260d902a1f571c6f0')

package() {
  install -d "$pkgdir"/usr/share/fonts/TTF
  install -Dm644 'RNIB License Agreement.txt' "$pkgdir"/usr/share/licenses/$pkgname/'RNIB License Agreement.txt'
  install -m644 *.ttf "$pkgdir"/usr/share/fonts/TTF/ 
}
