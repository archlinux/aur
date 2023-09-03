# Maintainer: Danie <danisdgk@gmail.com>
pkgname=ttf-monocode
pkgver=9.4.0
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
sha256sums=('42664654d6d742485eeb444accdb3d1695e874c664c2fd05e86cf5c6e0075c8b'
            'cf78313da2790fe30363e436db271214966cafd26ede6459ad8e36d2279bfd5f'
            'c8922046828fc9b0c97fe1912c8f6f38176018e7f9ff7e64b162dd71647da9a8'
            'bed957600d45ed998a161a7e460dc9b2eb1c83c6131d2c6c82ec8b45489e743c'
            'c2045103b43b293e8a0319e0624b1396af66e2fd5b02275be98ba07cc2b4a1a0'
            'e719fadb45ef0eef93763dfe8a3c838fec7bc3c1aad8f7a354cd8d2f0a7219aa'
            '1aff9e0117ebadf78d6d28609d294ad07cff97017bdfa72de1b4b3fba200bfec'
            'a46a48d934c703426069404147be051a4849f56bf87d1e77240d3da6476a876e'
            '734869cd60e4f13dc1e66307d1a7f0cb728b38c69990af0c09a8494b8b937d76'
            '824c544b7e3c44c7853ed0788942f07199a1c82b7899e80fcd33970fcc40d4b6'
            '3f41ef3c8872aea4774d66d4af65d84c2ae482fa93eb05986e7eb3a4bbef46e6')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
