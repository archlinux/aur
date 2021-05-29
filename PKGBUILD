# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-fixed-ss13
pkgver=7.0.0
pkgrel=1
pkgdesc='Typeface family designed for coding, terminal use and technical documents.'
arch=('any')
url='https://typeof.net/Iosevka/'
license=('OFL')
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/ttf-iosevka-fixed-ss13-${pkgver}.zip"
        "${pkgname}-${pkgver}-${pkgrel}-LICENSE.md::https://raw.githubusercontent.com/be5invis/Iosevka/v${pkgver}/LICENSE.md")
sha256sums=('d461a57a5ac713a9d2d0e4c56ae9e30b5fb289e592bcb7586db525c66f2f52ec'
            '72c3d557ff41d871680652f56afd565ba6834c90eadc45a4ec15410dce1c0c80')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
