# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-ss11
pkgver=3.6.3
pkgrel=1
pkgdesc='Typeface family designed for coding, terminal use and technical documents.'
arch=('any')
url='https://typeof.net/Iosevka/'
license=('OFL')
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/ttf-iosevka-ss11-${pkgver}.zip"
        "${pkgname}-${pkgver}-${pkgrel}-LICENSE.md::https://raw.githubusercontent.com/be5invis/Iosevka/v${pkgver}/LICENSE.md")
sha256sums=('a8a97c285c43dcdaebbce01ba90b1addabc5b39e0359a7153e7a19168bb7b6d5'
            'e61c0988bb231a321f14cce1b119a468f279ea86826c32e943ab16dbf08c1ba9')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
