# Contributor: feufochmar <feufochmar.gd@gmail.com>
pkgname=otf-pecita
pkgver=5.2
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

md5sums=('71eb605b8f5b6d6eb29f103be94eed7a'
         '3fa78374b78960f75ba6b4440309ac91')
sha256sums=('55c9c996dfe12c96a0032d427ea6a36fe273b40ca91190fdcbb41e6f7a25086f'
            '02db0ecd402bde9494564c4b0cbd4e4b8be4845e16ed8126c57d9dd93b04a065')
