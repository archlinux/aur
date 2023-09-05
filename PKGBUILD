# Maintainer: Danie <danisdgk@gmail.com>
pkgname=ttf-monocode
pkgver=9.4.2
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
sha256sums=('63a9b56215bfc763f69b843f4328b0dfe4e044a788d570a418018adb2394764d'
            '07a4595000b61a234f49a0410e2741c3122ae82bd975f8473e2ecb4b958278ea'
            '1b23eb9899e7d320878349ffeaff8d013c4e9f67cb6bfc5a347dac15c48fa073'
            '833e6bdf12acdca28c865da5220e2fb6e8eb0611bdacb7899bfef95f7af9d97e'
            'bb02c91f50a3a31075198934c9b669d177c825f46803a282089b650a74891f6c'
            'd3987c0aaa339e855e04e2b95a95eef918624aded1cdbaf03a612493142c9c8a'
            '1ddd0e8cf6fa956f1e86f6c6a6db16f40df4487749d2556672359aad7e15c329'
            'c3b1a391cd35e8b89f37216ba1c9cab7ffe2c4ee59d99de35bb24d17c959397b'
            '0961d0b7171269e2bbdae5158d4574025540164884ee6af1829cdd5dca059922'
            '6726b6ec6c2569e080dadab2305dcab7d1470ba726199287df3f2130ec7508e2'
            '3f41ef3c8872aea4774d66d4af65d84c2ae482fa93eb05986e7eb3a4bbef46e6')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
