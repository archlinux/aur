# Maintainer:
# Contributor: Danie <danisdgk@gmail.com>

pkgname=ttf-monocode
_name="${pkgname#ttf-}"
pkgver=18.1.4
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
sha256sums=('91e84dc6548e85f58c2fbe1f8a442dfd651c6f9e4071df3edc7946bd6ab32d47'
            '280f2f68d752a3cc0fd2d1c1926b0d8ed1dd118439f6854449f8bdb0658e6f44'
            '70dbd89f72aacbcce49657595e3e1ab82998ebbe0fcc361c62787acae72c6bc4'
            '6f87293d41c937840e9cc516de20081a0084dba570d4e3387df068e39dce10b6'
            'bcf6efa988f9248a09fb74376632f3a9a21269e99b41a70761377737d8713553'
            '9532f096b805ca55753b863e41c7b5e3e330ee73eb46e6239f0730316e1ea3f5'
            '370ddf573a064b1f30e1bec2f798624a9b5e5694cf8b93f5444c8b51d4d461cb'
            '1ca6fa8f5e64dcaa4cbc1aef343d76ed0ff10c8855934dfd042f2d71091d79a0'
            'badcd492ee4a07b5902adbf74260fb6f0365422bf0134bb320e723f289bfb625'
            'e53e63a800de040039de5076aa4e41247eccf445fea71f30150b1bdae95cec64'
            '3f41ef3c8872aea4774d66d4af65d84c2ae482fa93eb05986e7eb3a4bbef46e6')

package() {
    install -Dm644 *.ttf -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${_name}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
