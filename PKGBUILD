# Maintainer:
# Contributor: Danie <danisdgk@gmail.com>

pkgname=ttf-monocode
_name="${pkgname#ttf-}"
pkgver=18.0.1
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
sha256sums=('7991688b994924efb501f255ac96709d1fbf3b435a9b801f590883be12c48328'
            '74899fb1ce2112bb7c42b450eee184cb196ef03e4935bf45050b48efaa7e1145'
            'dba9d68078cd2ee8e740caeae4542108852640b76b787d169f742c7b347176a8'
            '2aba927f22ef5454870cc53de0a4576f2ae6506caed26b2e40d823f58ded7ac0'
            'c56c521654dc76b59dcb49dae96ecef56ef4eb12c0e280184d59af08f9b32d83'
            'f446395b5798e1cb04053ef87baf0aa77ab4d0080ace80a8e233a71f5f9107c4'
            '7c55d16421daa0994ae241d4835ec51280e74ccb2a00e1a708c01f6fb10f8d18'
            'ef7ed7bb3569e52f88d247adb569188f2dcd014f4c66a785418115027e004811'
            '2d4ee04088823fe74f6acf7f8b4127728f82e6285acf87e954806bf444cadfae'
            '8fc7053b2b69f7ab710c8a2028536f0b58fc5d5d4c422cf9ee9675a65014b489'
            '3f41ef3c8872aea4774d66d4af65d84c2ae482fa93eb05986e7eb3a4bbef46e6')

package() {
    install -Dm644 *.ttf -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${_name}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
