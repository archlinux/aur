# Maintainer:
# Contributor: Danie <danisdgk@gmail.com>

pkgname=ttf-monocode
_name="${pkgname#ttf-}"
pkgver=17.5.0
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
sha256sums=('9f5985552f4c78d3297780c9f288d21b3019ba4c1e524c53937f8e7ca4f72a33'
            '5df67097a2e93deb0c8d9ace6cc5c4a6a7d314f1567454481cb3fa36e1f52ff1'
            '8b842352c49c844999a60b9d9526870b800662e800684431b944bd422cd70236'
            'c85243685479a1a14a2f0afadba5ac96406daa18ca1fd84c8c0d520aa052b7e8'
            '59dc4273fa80e29522496f635641318627af5833aa82db3cdf64fef5b9167414'
            '98f5a788e6d7aa24bc12bf8d20d43fca8e73eb1f8f8a47f47db17cac89e4b0da'
            '2c0a0acc979fcfaf4397a9fa91683c147458d2d56a5a1ac535f3f353991ec462'
            '0e5d8ef4a2ffec43f1d3a274ea2307390abecd6c9d894f48691aa0f17f7b8b1f'
            '69973a8fa331bfba0b3f9805e2b621ec701256997b314549133a0ba4fe4d71d1'
            'b22b71400709bea328e40f41b22395907e0341ba273c5e557f3aa66c48c8bf57'
            '3f41ef3c8872aea4774d66d4af65d84c2ae482fa93eb05986e7eb3a4bbef46e6')

package() {
    install -Dm644 *.ttf -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${_name}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
