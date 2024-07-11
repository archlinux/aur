# Maintainer: James Barrios <hey@dendarrion.com>

pkgname=ttf-juliamono-nerd-font
pkgver=0.056
pkgrel=2
pkgdesc="JuliaMono, a font for programming, patched with Nerd Fonts (Regular, Mono, Propo)"
arch=('any')
url="https://github.com/mietzen/juliamono-nerd-font"
_variant="https://github.com/dendarrion/juliamono-nerd-font-variant"
license=('custom:SIL Open Font License v1.1')
source=(
	"${pkgname}-mono-v${pkgver}::${url}/releases/download/v${pkgver}/fonts.zip"
	"${pkgname}-variant-v${pkgver}::${_variant}/releases/download/v${pkgver}/ttf-juliamono-nerd-font-variant-v${pkgver}.zip"
	"${pkgname}-license::https://raw.githubusercontent.com/mietzen/juliamono-nerd-font/main/LICENSE"
)

package() {
	install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF/juliamono-nerd/" *.ttf
	install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF/juliamono-nerd/" "font/"{propo,regular}/*.ttf
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgname}-license"
}

sha256sums=('SKIP' 'SKIP' 'SKIP')
