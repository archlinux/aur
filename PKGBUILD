# Maintainer: Nicolas Gallienus <anorama@protonmail.com>

pkgname=ttf-forsvarsmakten-sans-stencil
pkgver=1
pkgrel=1
pkgdesc='Swedish Armed Forces stencil font'
arch=('any')
url='https://www.forsvarsmakten.se/sv/aktuellt/press/heraldiskt-vapen-och-logotyp/'
license=('unknown')

source=(
	'https://github.com/Gallienus/ForsvarsmaktenSansStencil/releases/download/v1/ForsvarsmaktenSansStencil.ttf'
)

md5sums=(
	'4d5456c66a4fe8db08d09b7800a5e206'
)

package() {
	mkdir -p "${pkgdir}/usr/share/fonts/TTF/"

	install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF/" "${srcdir}/ForsvarsmaktenSansStencil.ttf"
}
