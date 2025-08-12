# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttc-iosevka-ss10-super
pkgver=33.2.8
pkgrel=1
pkgdesc='Typeface family designed for coding, terminal use and technical documents.'
arch=('any')
url='https://typeof.net/Iosevka/'
license=('OFL')
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/SuperTTC-IosevkaSS10-${pkgver}.zip"
        "${pkgname}-${pkgver}-${pkgrel}-LICENSE.md::https://raw.githubusercontent.com/be5invis/Iosevka/v${pkgver}/LICENSE.md")
sha256sums=('2fe3f3a4dc1900dda0f9099ef3d04bf03689d40d786dcbd2da4fe54b86a1eebd'
            '52579dd4ebbda8e5a9d314e395dbfe40de82b4b7b3007ec8458876823af8dddd')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttc ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
