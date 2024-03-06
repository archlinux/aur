# Maintainer: James Barrios <hey@dendarrion.com>

pkgname=ttf-juliamono-nerd-font
pkgver=0.054
pkgrel=1
pkgdesc="JuliaMono, a font for programming, patched with Nerd Fonts"
arch=('any')
url="https://github.com/mietzen/juliamono-nerd-font"
license=('OFL-1.1')
source=(
    "${pkgname}v${pkgver}::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)

package() {
    install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF/" "juliamono-nerd-font-${pkgver}/font/"*.ttf  
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "juliamono-nerd-font-${pkgver}/LICENSE"
}

sha256sums=('SKIP')
