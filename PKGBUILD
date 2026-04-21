# Maintainer:
# Contributor: Danie <danisdgk@gmail.com>

pkgname=ttf-monocode
_name="${pkgname#ttf-}"
pkgver=20.4.0
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
sha256sums=('1cef6b2baa8ae035d629572b32a36a6f3b1ee2b3fd393607323f8f404cb6f814'
            '939127c55c45138ccd9431bc66a532d513471961c25bacdbf297a355535ce0aa'
            '2c70034e3bbde505eda42c822e66d5456c514f297e1de7012553835ab7df15de'
            '66b2995f4217263e57a9e51b0ebcbb2d00bb27a7ef1a2cdd8db898d9052e7a82'
            '243c3ebe92a24011e096d9884210be20ee6041d94cea01da99c3fbf0260e2cd7'
            'd091527d9faa57aebcae1bca47fa3eb5d2ae6b485528fa239f1ea43c5271bb11'
            '8b83f2b975b9ffa6340d7965832edf65ab3dbc6e27fcfd4a72497d414d7450d7'
            'fadba3beb765b8cfd2f6e8133afcfa575e8b5a68905d2d04b7f8be8dcdbcce2b'
            'fb75f3a743f98d1beabaa1ace2f8ef99abc8a6531a186e45d70e6d257793fcd8'
            '07c778eb5632ea4cff25731addcf25815ea57eebfb74830dd9d212afa5d87bd9'
            '3f41ef3c8872aea4774d66d4af65d84c2ae482fa93eb05986e7eb3a4bbef46e6')

package() {
    install -Dm644 *.ttf -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${_name}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
