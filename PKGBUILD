# Maintainer: Danie <danisdgk@gmail.com>
pkgname=ttf-monocode
pkgver=9.4.3
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
sha256sums=('8af0473be491a6d22dfd90db9556fb1d71d8d7e839275f26820bf3c94aa0aab1'
            'a9076d4c0c08874e9df91861c0a9ab08c15585967368c7290bd5f1af6b0d32b6'
            'c40181bd44eacf3999ad73c0fd6701a18068539e219b72a0ba0de8acee39519f'
            '6d491a61985d2f9b361417b1bab0064e5c1022e78813c7d81e130e6dd9196772'
            '21e81d399aa63208fa6ac78e8de6b9a799d0a7a8359a0e88e5872f3303f816be'
            '02c19f09e4b1bdbe093d26d82b85d7ebe41533e765bd9827ff4a782c2a2fe4dd'
            '4b074a62201099d0557f31617a81c667e87594d0c66d7dad6858d329a6d614e2'
            'dad1a702cf1d92ed4c34280bced5a83c473c54435db94a2a1b5f4d615ea66e43'
            '1a3d6e7d7b7e9db75d1a05e2cde17844e01053624e4fa4bfb9f64e5ae1b86dbd'
            '85d1f11d2a30c4de5b9e541c5587710f0983003ee5c137fb7ceff7d0c86b6f24'
            '3f41ef3c8872aea4774d66d4af65d84c2ae482fa93eb05986e7eb3a4bbef46e6')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
