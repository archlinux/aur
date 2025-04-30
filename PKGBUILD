# Maintainer:
# Contributor: Danie <danisdgk@gmail.com>

pkgname=ttf-monocode
_name="${pkgname#ttf-}"
pkgver=18.0.2
pkgrel=1
pkgdesc='A font derived from a customized version of Iosevka'
arch=('any')
url='https://github.com/aaronmbos/monocode'
license=('OFL-1.1')
source=("${_name}-${pkgver}-bolditalic.ttf::${url}/releases/download/v${pkgver}/monocode-normalbolditalic.ttf"
        "${_name}-${pkgver}-boldupright.ttf::${url}/releases/download/v${pkgver}/monocode-normalboldupright.ttf"
        "${_name}-${pkgver}-lightitalic.ttf::${url}/releases/download/v${pkgver}/monocode-normallightitalic.ttf"
        "${_name}-${pkgver}-lightupright.ttf::${url}/releases/download/v${pkgver}/monocode-normallightupright.ttf"
        "${_name}-${pkgver}-mediumitalic.ttf::${url}/releases/download/v${pkgver}/monocode-normalmediumitalic.ttf"
        "${_name}-${pkgver}-mediumupright.ttf::${url}/releases/download/v${pkgver}/monocode-normalmediumupright.ttf"
        "${_name}-${pkgver}-regularitalic.ttf::${url}/releases/download/v${pkgver}/monocode-normalregularitalic.ttf"
        "${_name}-${pkgver}-regularupright.ttf::${url}/releases/download/v${pkgver}/monocode-normalregularupright.ttf"
        "${_name}-${pkgver}-semibolditalic.ttf::${url}/releases/download/v${pkgver}/monocode-normalsemibolditalic.ttf"
        "${_name}-${pkgver}-semiboldupright.ttf::${url}/releases/download/v${pkgver}/monocode-normalsemiboldupright.ttf"
        "${_name}-${pkgver}-LICENSE::${url}/raw/v${pkgver}/LICENSE")
sha256sums=('c2721b9f86c93911818bcf67ae147b009fae5be4c2ee725b2bad0597a1924cfb'
            '3050dc7c80a009502bfc71069daacc51a15b58252c0929883563b66dfb102aa0'
            '7f0a7acc20010751458faa8929f7c0152c6fa26b73236e175bbd0e65fc608a43'
            '082bdb2e86e31a4d83b61da72a184be7f39df5ce6d993791c7c7975175760958'
            '04d8b356479003ec91d5b8a117fbb4be28fad5915011ce3b4a8c8537327c339a'
            '279ae28b6c5cb4a9289e6fcfbacdef42b88dcf8cb337d1eeb36d602f0b83a5d9'
            '9181843cb5c1e5ab803c328ed9a6f0d894cccf273c7db9cb5376f8afb609dc4d'
            '44afd750fe4c5ea41b3a6fdc8d040f353ad64489a81d9fd56059793a60f011a7'
            'bba4d6a90110f367aeed514b29de27b6e50e3b69f1ccba736b26c4f749ad0eda'
            '8ad49a780f462e99aa238b2ccafb73f6ba3fd63de3ac7501895a91009c38c677'
            '3f41ef3c8872aea4774d66d4af65d84c2ae482fa93eb05986e7eb3a4bbef46e6')

package() {
    install -Dm644 *.ttf -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${_name}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
