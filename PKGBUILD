# Contributor: feufochmar <feufochmar.gd@beleth.fr>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=otf-miama
pkgver=1.0
pkgrel=7
pkgdesc="A calligraphic font."
arch=('any')
url="http://www.dafont.com/fr/miama.font"
license=('OFL')
source=("http://img.dafont.com/dl/?f=miama")
sha256sums=('dfeb54cf95a7d28e6a861b6299edae32f41e50358896ada884d7b7f11d66125d')

package() {
  cd "$srcdir"
  install -D -m644 license.txt "$pkgdir"/usr/share/licenses/$pkgname/OFL
  install -d "$pkgdir"/usr/share/fonts/OTF
  install -m644 *.otf "$pkgdir"/usr/share/fonts/OTF/
}


