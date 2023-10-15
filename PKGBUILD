# Maintainer: Danie <danisdgk@gmail.com>
pkgname=ttf-monocode
pkgver=10.2.1
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
sha256sums=('f88aa3fbdaa9fc0fcca02d87d27a286ed2eaf1039f3b82f56b538cec88423e06'
            'e4b2d2455864a7ebaf93beeffd95876e67dab79c970672e0c67fa22c6f68fdab'
            '68fb8be405a80e541196ab89995368b7dd3f53d973b41324cbfb911addb7ee16'
            'd2f074b0ce87867a90e0e521d0b805ec8e80cd7827ce876b5e77ce0889b5c50c'
            '80676b4c56d0ec22035c77505d3c183f4755de0dc0b47dbdcad47301ed88f32f'
            'ebcf80bfddce12f665971db17ef2920a64a6e95f97a804887a32365040fba19f'
            '30aa48fc23a18c48a75787d571a3a8246ea148eeeb1438a616c85aedcf799991'
            '228e6c402809182ff65594de055d764f02463218afc35235b688d58573b6835f'
            '30fc3e26e8f000612b8138b3e316f5ae1c6011c7c5b15edad9bc0974aa8f9a9a'
            '640b5372af884e7fec2625804ae2e4ad294c1c16bfdfde34a13a580c4908fc3c'
            '3f41ef3c8872aea4774d66d4af65d84c2ae482fa93eb05986e7eb3a4bbef46e6')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
