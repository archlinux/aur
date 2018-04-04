# Contributor: feufochmar <feufochmar.gd@gmail.com>
pkgname=ttf-nova
pkgver=20110821
pkgrel=1
pkgdesc="A font familly originally created for making inscriptions on stone."
arch=('any')
url="http://openfontlibrary.org/font/nova"
license=('custom:OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=("https://fontlibrary.org/assets/downloads/nova/9fea9bf34ffdc4d4c44a8502d0deb44b/nova.zip")

package() {
  cd "$srcdir"/Nova
  install -D -m644 "SIL - Open Font License.txt" "$pkgdir"/usr/share/licenses/$pkgname/OFL
  mkdir -p  "$pkgdir"/usr/share/fonts/TTF
  install -m644 *.ttf "$pkgdir"/usr/share/fonts/TTF/
}
 
md5sums=('9fea9bf34ffdc4d4c44a8502d0deb44b')
