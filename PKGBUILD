# Contributor: feufochmar <feufochmar.gd@gmail.com>
pkgname=ttf-medievalsharp
pkgver=20110630
pkgrel=2
pkgdesc="A font based on gothic letters."
arch=('any')
url="http://openfontlibrary.org/font/medievalsharp"
license=('custom:OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=medievalsharp.install
source=("http://openfontlibrary.org/assets/downloads/medievalsharp/3ede0b439b3950fc0d1a7e1eb40151e0/medievalsharp.zip")

package() {
  cd "$srcdir"/MedievalSharp
  install -D -m644 "SIL - Open Font License.txt" "$pkgdir"/usr/share/licenses/$pkgname/OFL
  mkdir -p  "$pkgdir"/usr/share/fonts/TTF
  install -m644 *.ttf "$pkgdir"/usr/share/fonts/TTF/
}
 
md5sums=('3ede0b439b3950fc0d1a7e1eb40151e0')
