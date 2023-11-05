# Maintainer: Danie <danisdgk@gmail.com>
pkgname=ttf-monocode
pkgver=10.3.4
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
sha256sums=('90c50e49799708fa15c30cdabb08cb35aa6abcee886ff502640421b3375fe07c'
            'c9cf34d316a7c6025f3529ecfd56d300067ccfaf86e9e50b811210a3149ade50'
            '5b23b2a85dbfaca0e9743756827167b8499d215a6349ea036270b27a34366ecf'
            'cb73e18cfbe2890e6f7bc2589a4cadf537e64954c7599b8164a8f1e8b4f9ea5e'
            '8394239c4a3f4e6d05233d4c6686b9a460ef3738b018fd36bd4d3ba90eb15b96'
            '7143088d5b6036988c900bfbe2f5455366febb78121fefd5250bdbef1cbfb69a'
            '87b99f6df1d5959997d741b3c40a5a0a84e61660e2658aff4a96614dd298eba6'
            '4d8a985bbf2e96c8fae2f4c3cf9d2db3b6d0c82cf065e25d9b466c95f6428582'
            'a72f3f32971b05f7bf3f7afc75debb1716b2e09a52375282aeb80a159c1e1136'
            'dd23d09c6b45a6ec7b6a1f4583c1691fb250a6bc11faeabc7d2392084d325438'
            '3f41ef3c8872aea4774d66d4af65d84c2ae482fa93eb05986e7eb3a4bbef46e6')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
