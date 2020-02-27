# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=otf-londrina
pkgver=1.0
pkgrel=2
pkgdesc='Handwriting font inspired from the streets of Sao Paulo, Brazil'
arch=(any)
url="https://www.fontsquirrel.com/fonts/londrina"
license=(CCPL) # CC-BY-SA 3.0
source=("$pkgname-$pkgver.zip::https://www.fontsquirrel.com/fonts/download/londrina")
sha256sums=('47f63498a2752bd903ff7c9e0c9fa9d718d2c4c3abe9ca0d4bb5db03be53b7d2')

package() {
	install -Dm644 -t "$pkgdir/usr/share/fonts/OTF" *.otf
}
