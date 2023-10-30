# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: feufochmar <feufochmar.gd@beleth.fr>

pkgname=otf-miama
epoch=1
pkgver=0.031
pkgrel=1
pkgdesc='A calligraphic font'
arch=(any)
url="http://www.dafont.com/fr/miama.font"
license=(OFL)
source=("$pkgname-$pkgver.zip::http://dl.dafont.com/dl/?f=miama")
sha256sums=('dfeb54cf95a7d28e6a861b6299edae32f41e50358896ada884d7b7f11d66125d')

package() {
	install -Dm0644 -t "$pkgdir/usr/share/fonts/OTF/" *.otf
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/OFL/" license.txt
}


