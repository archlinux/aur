# Contributor: feufochmar <feufochmar.gd@gmail.com>
pkgname=otf-dotrice
pkgver=1.001
pkgrel=2
pkgdesc="A font designed to look like an old EPSON FX-80 printer."
arch=('any')
url="http://openfontlibrary.org/font/dotrice"
license=('custom:OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=dotrice.install
source=("http://openfontlibrary.org/assets/downloads/dotrice/8bbaa7a763470e5a042344fd2a6a9907/dotrice.zip")

package() {
  cd "$srcdir"/hdad-dotrice-"$pkgver"
  install -D -m644 "OFL.txt" "$pkgdir"/usr/share/licenses/$pkgname/OFL
  mkdir -p  "$pkgdir"/usr/share/fonts/OTF
  install -m644 *.otf "$pkgdir"/usr/share/fonts/OTF/
}
 
md5sums=('8bbaa7a763470e5a042344fd2a6a9907')
