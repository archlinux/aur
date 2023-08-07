# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttc-iosevka-ss09-super
pkgver=26.0.2
pkgrel=1
pkgdesc='Typeface family designed for coding, terminal use and technical documents.'
arch=('any')
url='https://typeof.net/Iosevka/'
license=('OFL')
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/super-ttc-iosevka-ss09-${pkgver}.zip"
        "${pkgname}-${pkgver}-${pkgrel}-LICENSE.md::https://raw.githubusercontent.com/be5invis/Iosevka/v${pkgver}/LICENSE.md")
sha256sums=('e2eba668a8bcfb3f27f26515c5bc445b3824ae3717d0e3bf9ea621be86c0d91d'
            '7484961b97b41985d54c21700e53f7142a7007d72401acbd32c0b9c6a5a0b558')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttc ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
