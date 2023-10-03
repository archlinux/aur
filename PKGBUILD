# Maintainer: Danie <danisdgk@gmail.com>
pkgname=ttf-monocode
pkgver=10.1.0
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
sha256sums=('b78d6f47bbb4d487754faeea823307013415392eee6c318e20ab72a6caf598d8'
            '7c199c88606a33c3f8a03a1e6b55c545e5c90680a7132d4b0289dca5c5f7653a'
            '9d8ad4ec6d96b06b0bfb9e4b0c84376e66708dfbe6d63e652a6f8bb5a0b272df'
            'f43b2891bba5b6bf2bdb5732c7f1d3c58e513402057cae9fc0826b8ce3549750'
            'f1153046e368c01cd351b547a5932bd7956378e593011f82f02a65267a88e980'
            'd9b6dcc5a19056f0a44329466d043f3f5358ffaba73f0462d61901626804e7ec'
            'ec37090b222bdef7bb980f1b2fe0a943b2429dd047b58135d37b6f0e9c5ba0d7'
            'c36bf97e16550c2de69fbe42c2c41605fd53791828e1efb3f3a02e7b963271b7'
            '2220360f429c4b69ead00ecfe536c9d0b679f194c8ff62e10e24a5a996fb4774'
            '474805c4e378d96222f951a042ffa71cd9c36e43ae9dbf85c5f01e0b04032021'
            '3f41ef3c8872aea4774d66d4af65d84c2ae482fa93eb05986e7eb3a4bbef46e6')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
