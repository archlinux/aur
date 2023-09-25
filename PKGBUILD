# Maintainer: Danie <danisdgk@gmail.com>
pkgname=ttf-monocode
pkgver=10.0.1
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
sha256sums=('2847780e79840ba504b1a0ca2c8ee8dc2bbe75eced137d2f940ece6b066b3d5a'
            'b317a810eb4de3322811505475c8cfc819d3707409aaa4269432d399da1482d1'
            '461367c05b87de8c0d150499b14d0e1ab2f46795d31201f92bf4d1a153a5e333'
            '2d149cc2ce9b05b5073a6e7b88089a74eb7cb8cb5ce1b263e6698104d4ddfc5e'
            'bbfc78b8b2fd3beee4306a407657d741a4608f5b1031a2a3b17161144c8a901e'
            '46a4f54fd5074fdcdbda90426b8b8582e8cf51049f77166edd5048b8379d3e7a'
            'c8b4aef8f3e80f8f85c5a27233cae72a014b91a38fa06c97072d672d76ad9f73'
            '9b5068d422c4c5f605a149b4cd213b66b4fe27770598f1f0d5fb7bb6dff4ade7'
            'b9121cd8915886d8ba28e06e3a5bb1ca541d119c5c9a40b0f04288892e8091c1'
            '384072dc1d95f430a6b01f7466a796b0527f36f7eaef78add5d5641da994f59d'
            '3f41ef3c8872aea4774d66d4af65d84c2ae482fa93eb05986e7eb3a4bbef46e6')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
