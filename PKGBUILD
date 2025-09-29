# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttc-iosevka-ss14-super
pkgver=33.3.1
pkgrel=1
pkgdesc='Typeface family designed for coding, terminal use and technical documents.'
arch=('any')
url='https://typeof.net/Iosevka/'
license=('OFL')
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/SuperTTC-IosevkaSS14-${pkgver}.zip"
        "${pkgname}-${pkgver}-${pkgrel}-LICENSE.md::https://raw.githubusercontent.com/be5invis/Iosevka/v${pkgver}/LICENSE.md")
sha256sums=('c1efff70fe36103580ca16f8a93afc943fd6d4a82507c46a5edf183165125c0c'
            '52579dd4ebbda8e5a9d314e395dbfe40de82b4b7b3007ec8458876823af8dddd')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttc ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
