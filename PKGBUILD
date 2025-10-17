# Maintainer:
# Contributor: Danie <danisdgk@gmail.com>

pkgname=ttf-monocode
_name="${pkgname#ttf-}"
pkgver=18.1.1
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
sha256sums=('d93f036da12961f026f5b19624d51ab63b184566e74abc2f59d6fe1f5555dad4'
            '165d37221747d25e25f254dad258a50debb946ff35df63554d94537ef8f3a8d3'
            '3161205d9a19f9608dccfee766180a1fa0df56a16200ea8b3becfc40fec6081e'
            'c5bd814e6b5ad24decc211517d72c4c1ce30dca091a57a3e63ba62497e00f9d7'
            '6e8c455f25c8ff1e61c5232411c36da3d2466743785b49d438dfa0b564162a10'
            '92ebab9bb2ee4baab133aaa3d4b007484aa9d9aad16e90ff695b3e744b5783f8'
            'eacad0f78e207876a1bd6eb9552cd7b879295d0fe1fef4bd626815ac6388af24'
            '8f4092561f5701823352ddfb3179331b74b2713f3a7929de999ff6eb691dc147'
            'b668b7bd09625190f63361cc34169a33d59edba665972a9fe500091910bb9a05'
            'e3ca524b9400f628bcb31280b336c2eaab3635789bd6fe184ec2b2074189effb'
            '3f41ef3c8872aea4774d66d4af65d84c2ae482fa93eb05986e7eb3a4bbef46e6')

package() {
    install -Dm644 *.ttf -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${_name}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
