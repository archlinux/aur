# Maintainer: Qiumix <j487428862@gmail.com>

pkgname=ttf-smile-nerd
pkgver=1.0.1
pkgrel=1
pkgdesc="Best programming language font with CJK support, which remix FiraCode Mono and LXGW Wenkai Mono"
arch=('any')
url="https://github.com/SOV710/smile-nerd-font"
license=('OFL')
provides=("${pkgname}")
conflicts=("${pkgname}-git" "${pkgname}-font")
source=("SmileNerdFontMono-Regular-${pkgver}.ttf::${url}/releases/download/v${pkgver}/SmileNerdFontMono-Regular.ttf"
        "SmileNerdFontMono-Light-${pkgver}.ttf::${url}/releases/download/v${pkgver}/SmileNerdFontMono-Light.ttf"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/SOV710/smile-nerd-font/refs/heads/main/LICENSE")
sha256sums=('1cb5d56c165deaa230c7292d9a68e03791cb5a4d1cc797f0262d4ac4e54fc0bd'
            '696585d460abd3a0e5818f745b97e4a70f00ffb2bc0ebb364d0f5b75c3f8d4c7'
            'af3cb2ff48b5dffc4d0095116cf4b3b459597d384b6c46604f39c7b71408524e')

package() {
    install -Dm644 "SmileNerdFontMono-Regular-${pkgver}.ttf" "${pkgdir}/usr/share/fonts/${pkgname}/SmileNerdFontMono-Regular.ttf"
    install -Dm644 "SmileNerdFontMono-Light-${pkgver}.ttf" "${pkgdir}/usr/share/fonts/${pkgname}/SmileNerdFontMono-Light.ttf"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
