# Contributor: feufochmar <feufochmar.gd@gmail.com>
pkgname=otf-pecita
pkgver=5.1
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

md5sums=('95cef991d27bc8690492c41864afdfa5'
         '3fa78374b78960f75ba6b4440309ac91')
sha256sums=('442fb87a9266472be1f0adf6236c0bdc945afc378d3a3a6002c805faf736536c'
            '02db0ecd402bde9494564c4b0cbd4e4b8be4845e16ed8126c57d9dd93b04a065')
