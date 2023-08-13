# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-aile
pkgver=26.1.0
pkgrel=1
pkgdesc='Typeface family designed for coding, terminal use and technical documents.'
arch=('any')
url='https://typeof.net/Iosevka/'
license=('OFL')
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/ttf-iosevka-aile-${pkgver}.zip"
        "${pkgname}-${pkgver}-${pkgrel}-LICENSE.md::https://raw.githubusercontent.com/be5invis/Iosevka/v${pkgver}/LICENSE.md")
sha256sums=('d2edc7a2cde51e3b58f52c5bc58a36bd31ae0a79d1895b13753e6cc6bc6ead05'
            '7484961b97b41985d54c21700e53f7142a7007d72401acbd32c0b9c6a5a0b558')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
