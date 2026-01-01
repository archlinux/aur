# Maintainer:
# Contributor: Danie <danisdgk@gmail.com>

pkgname=ttf-monocode
_name="${pkgname#ttf-}"
pkgver=18.1.6
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
sha256sums=('9147ffb5b7ff056e12e81e349d99ce9b24938f3f82a75b20a7569169e53da574'
            '38038d03bc099a9a246b0f70c8ec4854ae6f42a8620d642c7de02c9f618cfb0b'
            'b8eb751b587edfd8a16d7eba4c0cc253705a05be45bc2247016d3472ed5a9304'
            '591dcb198e8bc81ef021da3812b21866dd8fbc86f9ca2cbdfb1e6fc6e9dc8f86'
            'e5156f8f5ac538abf82212922524514a6a00158cbb1014326149f9be48cd2d43'
            '14d8fbe006a6dbdbdd48cd9694952e455f7904f09396ca17212c46f5f973e2ec'
            '60733521a680feb9da147a8c33d9a956dd845677c1a9c258a3540fb00991a5e2'
            '0f5883d71669e877b4694c293dbad9c62084c78cb0c2dc3910e1efa9ce18a1a7'
            '0cc0b37036e605bbecb3b7295ba6f354b0229d3200374047cfde303372460b46'
            'de09771571bc59acd64487212aeb3b0914429306737615f475fffc39000b961b'
            '3f41ef3c8872aea4774d66d4af65d84c2ae482fa93eb05986e7eb3a4bbef46e6')

package() {
    install -Dm644 *.ttf -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${_name}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
