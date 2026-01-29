# Maintainer:
# Contributor: Danie <danisdgk@gmail.com>

pkgname=ttf-monocode
_name="${pkgname#ttf-}"
pkgver=20.1.0
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
sha256sums=('cb81e5cfa2ee1a9f4e0539f156079a0d3561703e297eb60b5e4786e6e3026891'
            '6c90ef36c48446ccd94510b246cbe38abd289edfab2def3b6e13a2d797ed8f00'
            '7a7807e4814a22e31b4ea75b0d1f7e70451e3303e6551fc107940914fbf33c4a'
            'bf33fb471aaf566e49322ad40c6952c2b4b0ff17ebba60e29d6b3928fbf67317'
            '2bbbacbef33f01542ead430da004c2c64f45ee34a9206ced5857f6a876bd97e4'
            '2eedfeb13d09fd19a494fb318e2d7a4aa1525a79cf445bd565e1377f767de33b'
            'f078a0de54d4a4e2da2fa3fe8a3fd16c44ed37e8d4130dc0ad77db0a6d7b5bef'
            '4d1ccf023b22b1222fb2967f1e67ad555e2356ca98ff35f7af33994e1af917eb'
            '3bcf1bb20ef85ffc3a76cd10d4c0d50b9ccda0f5cc269009f7378969ef149cc6'
            '3e4897638e0e40c979dc099dc94d5c75be9272b956e4b307ece89e5249818006'
            '3f41ef3c8872aea4774d66d4af65d84c2ae482fa93eb05986e7eb3a4bbef46e6')

package() {
    install -Dm644 *.ttf -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${_name}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
