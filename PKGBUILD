# Maintainer: Danie <danisdgk@gmail.com>
pkgname=ttf-monocode
pkgver=9.3.1
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
sha256sums=('1ec00ce621b587ae3e9bf06baa49d50709392ef3b9314c21791abd0850011c87'
            'd4ea101acb0f7faf36521af2e15a49b1140812deefc2bb4fd1b27ecf4e8d6639'
            '42705a932bc97f379d72f338ff2a14584e239a671f52ae3af92ed7fe7deb8703'
            'ffa06541a398b32e726b1b68c84007f000033a52de7f4234d70ef3a23233f520'
            '2f54da5e6702be155a9f0416ab7994eea43dff767af4b88d0a3669b7f4b995b8'
            'ba185021b16a058e0141318e828ed322f2a1810723f9c29caf9a9136ad91ad80'
            '4b17b28c938f88a997914fdc78d0c7ad20a5a006c5ae08f856605409d5261a58'
            '319dd7d59cb1e2c1fb8c2657fba43628dc2a251fa66a1069b4e4e54bd9a3f884'
            '52d9e406c9e7ab2b20fe9eab51233eb43b1cf71bf35ae6cdd9bdeb259e30b1d2'
            '5fc50c0e7cc5c5e165d3263015088f77a86342b38c7bf6f194fbdcc0f9424dc8'
            '3f41ef3c8872aea4774d66d4af65d84c2ae482fa93eb05986e7eb3a4bbef46e6')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
