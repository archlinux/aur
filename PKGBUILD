# Contributor: feufochmar <feufochmar.gd@gmail.com>
pkgname=ttf-nova
pkgver=20110529
pkgrel=2
pkgdesc="A font familly originally created for making inscriptions on stone."
arch=('any')
url="http://openfontlibrary.org/font/nova"
license=('custom:OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=nova.install
source=("http://openfontlibrary.org/assets/downloads/nova/84af1e3cda286046b841f0d608a87da4/nova.zip")

package() {
  cd "$srcdir"/Nova
  install -D -m644 "NovaCut/SIL - Open Font License.txt" "$pkgdir"/usr/share/licenses/$pkgname/OFL
  mkdir -p  "$pkgdir"/usr/share/fonts/TTF
  install -m644 */*.ttf "$pkgdir"/usr/share/fonts/TTF/
}
 
md5sums=('84af1e3cda286046b841f0d608a87da4')
