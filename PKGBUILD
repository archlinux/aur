# Maintainer: Danie <danisdgk@gmail.com>
pkgname=ttf-monocode
pkgver=10.2.0
pkgrel=1
pkgdesc='A font for code.'
arch=('any')
url='https://github.com/aaronmbos/monocode'
license=('OFL')
source=("https://github.com/aaronmbos/monocode/releases/download/v${pkgver}/monocode-bold.ttf"
        "https://github.com/aaronmbos/monocode/releases/download/v${pkgver}/monocode-bolditalic.ttf"
        "https://github.com/aaronmbos/monocode/releases/download/v${pkgver}/monocode-italic.ttf"
        "https://github.com/aaronmbos/monocode/releases/download/v${pkgver}/monocode-light.ttf"
        "https://github.com/aaronmbos/monocode/releases/download/v${pkgver}/monocode-lightitalic.ttf"
        "https://github.com/aaronmbos/monocode/releases/download/v${pkgver}/monocode-medium.ttf"
        "https://github.com/aaronmbos/monocode/releases/download/v${pkgver}/monocode-mediumitalic.ttf"
        "https://github.com/aaronmbos/monocode/releases/download/v${pkgver}/monocode-regular.ttf"
        "https://github.com/aaronmbos/monocode/releases/download/v${pkgver}/monocode-semibold.ttf"
        "https://github.com/aaronmbos/monocode/releases/download/v${pkgver}/monocode-semibolditalic.ttf"
        "${pkgname}-${pkgver}-${pkgrel}-LICENSE.md::https://raw.githubusercontent.com/aaronmbos/monocode/v${pkgver}/LICENSE")
sha256sums=('b616d4b6780a05453a20f9b38204e8f7867b67a33f4a23c97b33c034987128ab'
            '609cc99770b4dbe0a3890a570e6cd7b077e22f239ab1c1825769c2753c06bb2c'
            'b3bbcc7dd4141646463410239b9febe83bc019efedb0ff9b956c2d69ab6e9f0f'
            'd12714412c432d2abaa8cfd95cc2cf1d15287687ebd7a9f7770fce947e5fb9c1'
            'ab6795b473f0a2e0fc214ea29f787249b48861f8db4f6a34022eb40ee2a6a094'
            'cf013847f1a60f2ecfffcb3e8748f80647e3e859d23ff7a89db456dd005851f7'
            'e023f020d3997d1549a7df6d4f1b5a7af930f51073050c7513e5bb2c14853835'
            'd3861d15c6191becb1fad4a8dcb985a838c01a364adb1809abf22116d622254c'
            '68d7d138d3e7ad572e70f3e830d348fac4ca9f211623897557fd2b7889e2a826'
            '8a2e169f1ab22eccf0fb50b72b268941cabea1df21b4615fea508c28ab2e7b33'
            '3f41ef3c8872aea4774d66d4af65d84c2ae482fa93eb05986e7eb3a4bbef46e6')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
