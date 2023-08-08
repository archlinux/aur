# Maintainer: Danie <danisdgk@gmail.com>
pkgname=ttf-monocode
pkgver=9.0.2
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
sha256sums=('66135f8862b4f9d2155e5f28f122c0f68a2fb13cdd723b7635a3d3029ff446a5'
            '75c73329fda70bac02b5108968553ca870d8484c61f74952c37ef4cdc1e3f1e7'
            '000117379f79e6ca3cb18691ce4159564818f344f3385b18061fc6229eb13160'
            '508fca9a0caf8a4fe59a498d089222f91729b4136cb148de65d6c98543402160'
            'bb09415b1066b1ef0c117f9606f465aad71330a240c496fd394b95cc817fac8f'
            'd3630a51af56e4cd86d16fb307f9fa7fd6b1fe35a6e52582ebfe2217aaca23c0'
            'd19445f16398344c627b16d1301115d2f61fb404374bb043cff74a102b538d4c'
            '1777ffa0adbd73b2355616e49f1f6443b820dd52845c035afa9752c820ad9294'
            '730cf9b129c3c8f5b479acac7cc001616fb7a21b2f897f15c0b285b442db49ec'
            '078cf1f1e1296993d07cbe7e60cca417f773f183c73c58fb4974e5f505b9090b'
            '3f41ef3c8872aea4774d66d4af65d84c2ae482fa93eb05986e7eb3a4bbef46e6')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
