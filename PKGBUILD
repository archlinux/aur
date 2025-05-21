# Maintainer:
# Contributor: Danie <danisdgk@gmail.com>

pkgname=ttf-monocode
_name="${pkgname#ttf-}"
pkgver=18.0.3
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
sha256sums=('5e4fa3725c9e3543da1a9f9060e5bf0c8d71563b3afa1f4d538b7b7dc4959963'
            'af18f324e256aebf4f0618fb2884aed869e35eb2780532c6ed7c6dd0f2135796'
            'eacb6d79997ce48ec4b6000c7a1cc42dde144f8f7b259dccd88ae1b492d3b90a'
            '082e8523cc9160fb0c41a341b2bb543d8dc215949585ec9a567375c3c4c5bd8a'
            '7ec28d205dd090c1754f991d86a582dbf061edcb002c9acce41bfb0068f77bc1'
            '5beaa24decbe72900fd4ab471a5cdc42511eda34502e35ba66b30a50e473b5c0'
            'b09817174b3ddb4b294f6b6d9c702c62c23764cf21c0fc768993ce4b7d40b052'
            'e6c23f44ffd62e6d75e94566fc0b3dcc11a52c0930257fcec69f4132eca45f24'
            '4750f02842337e2f28c5bcdb20892c75d2b97d6b8dfbafb3fcc7f315f260fad8'
            '4f57802634e8722b6717e18b47312dada27f83deb2ee1d955f2366fca8633c8b'
            '3f41ef3c8872aea4774d66d4af65d84c2ae482fa93eb05986e7eb3a4bbef46e6')

package() {
    install -Dm644 *.ttf -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${_name}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
