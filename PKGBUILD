# Maintainer: Danie <danisdgk@gmail.com>
pkgname=ttf-monocode
pkgver=9.1.0
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
sha256sums=('b503641b05659994394a5e3dbb143d912dbc81287ac9ebaa68cea720ddcca1ef'
            '33b49a2884f7482cb31dd0b1ae846fe79725d85bb8e9549b31be8056f7d50213'
            '359dcf126a411fe63d320fa465a8b10a65a78c94cb821c0d7cf83e41de0d12f3'
            'ef6a74fe0df99733debb7c794557606e474062045e573bfb7f0e6e594c12e630'
            '6b1f4c6cb25de2b12ec1663b5671aa96ae374414a2af37fb46623b561f5985ae'
            'bb14a195da9db46c464bdb431b2f20be087ece66783d8999182874e5695d772e'
            '8a7c07b511111dedfc3f8d345856dd354fc36c58697f88f5d0327eb4f7145c1c'
            '5eba5cd2f02c51c9ba6178b00036b21441dd02e555787459a92812be1ad21c06'
            '47276a9e2f14b0c2c708d4273d4a08b7eae66c41081dddf3c0877fa8a393c3af'
            '1d80033502d3848d78bee8ec49dbb0fe389f913e419a15c75a5ffa13abeafb2a'
            '3f41ef3c8872aea4774d66d4af65d84c2ae482fa93eb05986e7eb3a4bbef46e6')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
