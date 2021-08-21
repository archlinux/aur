# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: feufochmar <feufochmar.gd@beleth.fr>

pkgname=ttf-caracteres
pkgver=1.0
pkgrel=5
pkgdesc="A family of typefaces used on roadsigns in France."
arch=('any')
url="https://fonts.simplythebest.net/font/367/caracteres-font.font"
license=('custom')
source=("$pkgname-$pkgver.zip::https://fonts.simplythebest.net/fonts/download=367")
sha256sums=('fc757e4429f1b4f469ef63f33c04f990064bfa7fb6e37a81946ff42c44f3ed32')

package() {
	install -Dm 644 *.ttf -t "$pkgdir/usr/share/fonts/TTF/"
	install -Dm 644 Caracteres.txt -t "$pkgdir/usr/share/doc/$pkgname/"
}
