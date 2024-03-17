# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=otf-londrina
pkgver=1.003
pkgrel=1
pkgdesc='Handwriting font inspired from the streets of Sao Paulo, Brazil'
arch=(any)
url="https://tipospereira.com/londrina-typeface"
license=('OFL-1.1-RFN')
source=("https://github.com/marcelommp/Londrina-Typeface/releases/download/fullrelease/Londrina.zip"
        LICENSE)
sha256sums=('9fd0a9aac75ea1d86c65e016afb6afd97f3f13af0877de5f39787d7ee94bd258'
            '8a5018cb446fe48a3afa07fb1e9ea2ef02f13f6d51df3e38c704ad1e80d6b60c')

package() {
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
	install -Dm644 -t "$pkgdir/usr/share/fonts/OTF" ./*/*.otf
}
