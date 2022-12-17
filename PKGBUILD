# $Id$
# Maintainer:  Radu Potop <radu at wooptoo dot com>

pkgname=lora-cyrillic-font
pkgver=3.003
pkgrel=1
pkgdesc='Contemporary serif font that supports Latin and Cyrillic scripts. Includes OTF, TTF, Variable and Webfonts.'
arch=('any')
url="https://github.com/cyrealtype/Lora-Cyrillic"
license=('OFL')
source=(
    "${url}/releases/download/v${pkgver}/Lora-v${pkgver}.zip"
)

package() {
    mkdir -p "${pkgdir}/usr/share/fonts/OTF/"
    mkdir -p "${pkgdir}/usr/share/fonts/TTF/"
    mkdir -p "${pkgdir}/usr/share/fonts/Variable/"
    mkdir -p "${pkgdir}/usr/share/fonts/Webfonts/"
    cd "${srcdir}"
    install -Dm644 otf/* "${pkgdir}/usr/share/fonts/OTF/"
    install -Dm644 ttf/* "${pkgdir}/usr/share/fonts/TTF/"
    install -Dm644 variable/* "${pkgdir}/usr/share/fonts/Variable/"
    install -Dm644 webfonts/* "${pkgdir}/usr/share/fonts/Webfonts/"
}

sha256sums=('a57f214f5980c86bd5f2799eaf554a0b5503c30981e013d2f7840704f80b5b76')
