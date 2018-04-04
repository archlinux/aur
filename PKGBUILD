# Contributor: feufochmar <feufochmar.gd@gmail.com>
pkgname=otf-pecita
pkgver=5.4
pkgrel=2
pkgdesc="A handwritten font with attached letters."
arch=('any')
url="http://pecita.eu"
license=('custom:OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=("http://pecita.eu/b/Pecita.otf" "OFL.txt")

package() {
  cd "$srcdir"
  install -D -m644 OFL.txt "$pkgdir"/usr/share/licenses/$pkgname/OFL
  mkdir -p  "$pkgdir"/usr/share/fonts/OTF
  install -m644 *.otf "$pkgdir"/usr/share/fonts/OTF/
}

md5sums=('2d9707af5d62c09a782b31aa96de12cb'
         '3fa78374b78960f75ba6b4440309ac91')
