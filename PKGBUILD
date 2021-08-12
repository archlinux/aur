# Contributor: feufochmar <feufochmar.gd@gmail.com>

pkgname=otf-pecita
pkgver=5.4
pkgrel=3
pkgdesc="A handwritten font with attached letters."
arch=('any')
url="http://pecita.eu"
license=('OFL')
source=("http://pecita.eu/b/Pecita.otf" "OFL.txt")
sha256sums=('0fd219fa9e1414750db7d99eec3e2fbf4c7aacc2bd21a56228f962084c97eade'
            '02db0ecd402bde9494564c4b0cbd4e4b8be4845e16ed8126c57d9dd93b04a065')

package() {
  cd "$srcdir"
  install -D -m644 OFL.txt "$pkgdir"/usr/share/licenses/$pkgname/OFL
  mkdir -p  "$pkgdir"/usr/share/fonts/OTF
  install -m644 *.otf "$pkgdir"/usr/share/fonts/OTF/
}
