# Contributor: feufochmar <feufochmar.gd@gmail.com>
pkgname=otf-nemoy
pkgver=20110513
pkgrel=2
pkgdesc="A font for space traveler."
arch=('any')
url="http://openfontlibrary.org/font/nemoy"
license=('custom:OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=nemoy.install
source=("http://openfontlibrary.org/assets/downloads/nemoy/a3347504a711e41edd8de2d5d7312b6f/nemoy.zip")

package() {
  cd "$srcdir"/Nemoy
  install -D -m644 "OFL.txt" "$pkgdir"/usr/share/licenses/$pkgname/OFL
  mkdir -p  "$pkgdir"/usr/share/fonts/OTF
  install -m644 *.otf "$pkgdir"/usr/share/fonts/OTF/
}
 
md5sums=('a3347504a711e41edd8de2d5d7312b6f')
