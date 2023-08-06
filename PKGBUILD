# Maintainer: Markus Weimar <mail@markusweimar.de>
pkgname=ttc-iosevka-ss16-super
pkgver=26.0.1
pkgrel=1
pkgdesc='Typeface family designed for coding, terminal use and technical documents.'
arch=('any')
url='https://typeof.net/Iosevka/'
license=('OFL')
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/super-ttc-iosevka-ss16-${pkgver}.zip"
        "${pkgname}-${pkgver}-${pkgrel}-LICENSE.md::https://raw.githubusercontent.com/be5invis/Iosevka/v${pkgver}/LICENSE.md")
sha256sums=('8fc7a8cb9e4f0d2221aa3e01c5c4a3e8e53dbdd03ef8556baf359cf5d95978d6'
            '7484961b97b41985d54c21700e53f7142a7007d72401acbd32c0b9c6a5a0b558')

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF/
    install -m644 *.ttc ${pkgdir}/usr/share/fonts/TTF/
    install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
