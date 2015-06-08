# Contributor: shadowkyogre <shadowkyogre.public@gmail.com>
pkgname=otf-rebecca
pkgver=1.001
pkgrel=1
pkgdesc="A script font with great vibes."
arch=('any')
url="http://openfontlibrary.org/font/rebecca"
license=('custom:OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=rebecca.install
source=("http://openfontlibrary.org/assets/downloads/rebecca/d32a4d9e4887fccf9ce200538290cd10/rebecca.zip")

package() {
  cd "$srcdir"
  mkdir -p  "$pkgdir"/usr/share/fonts/OTF
  install -m644 *.otf "$pkgdir"/usr/share/fonts/OTF/
}
md5sums=('d32a4d9e4887fccf9ce200538290cd10')
