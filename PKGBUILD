# Contributor: feufochmar <feufochmar@d-20.fr>
pkgname=otf-pecita
pkgver=4.3
pkgrel=1
pkgdesc="A handwritten font with attached letters."
arch=('any')
url="http://pecita.eu"
license=('custom:OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=pecita.install
source=("http://pecita.eu/b/Pecita.otf" "OFL.txt")

package() {
  cd "$srcdir"
  install -D -m644 OFL.txt "$pkgdir"/usr/share/licenses/$pkgname/OFL
  mkdir -p  "$pkgdir"/usr/share/fonts/OTF
  install -m644 *.otf "$pkgdir"/usr/share/fonts/OTF/
}


md5sums=('b5f7720776558bc6799c6a4259844121'
         '3fa78374b78960f75ba6b4440309ac91')
