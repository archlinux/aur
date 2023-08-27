# Maintainer: Danie <danisdgk@gmail.com>
pkgname=ttf-monocode
pkgver=9.3.2
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
sha256sums=('08eb894df2a6b19d997553d81e2c97c8cd8da3bc4e26b6b3dc3db1d35807a41d'
            '1c83f29c74674810b633d10af359ac57ab84fd5d486fec2df698a7f8f08a415c'
            '9c4201e9530bb88a9e7ec2971644fc7d04042a96d120a1ad7df8321d7f2d4247'
            'b840794af8a76b4cbe06b1fdb5856bce2839e556e667b7522d679ee7b99c43e3'
            '597c8e1a0e095805d879b8fe27aa20307c612468b29f1b0b56ef196d4d757343'
            '1b2415d0f5651f0d07782ff44c029309dcfd0401e9f701c777cff4e920c86f97'
            '2b3f8583a5b689314d157cc142f00f31322ae8c835b90b9e00333148b2f9613e'
            'edad2d75dfe1834f72717ad151258c11d5532d59b59efc870c82f4f2984cca4a'
            'b9555997eb4ca26fb28a24de410ed645394d08f1c1cddc8ca919c7f583fe87fd'
            'df5c870a3e0d534d47b85756a968d00c5a5747da9f688004abf7dc883397ed71'
            '3f41ef3c8872aea4774d66d4af65d84c2ae482fa93eb05986e7eb3a4bbef46e6')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
