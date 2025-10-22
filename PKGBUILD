# $Id$
# Maintainer:  Radu Potop <radu at wooptoo dot com>

pkgname=lora-cyrillic-font
pkgver=3.021
pkgrel=1
pkgdesc='Contemporary serif font that supports Latin and Cyrillic scripts. Includes OTF, TTF, Variable and Webfonts.'
arch=('any')
url="https://github.com/cyrealtype/Lora-Cyrillic"
license=('OFL')
source=(
    "${url}/releases/download/v${pkgver}/Lora.zip"
)
sha256sums=('19061972d1124d258dffd41f3ad12ce2db513f9b31fb98ece7afe7b538e8647f')

package() {
    mkdir -p "${pkgdir}/usr/share/fonts/OTF/"
    mkdir -p "${pkgdir}/usr/share/fonts/TTF/"
    mkdir -p "${pkgdir}/usr/share/fonts/Variable/"
    mkdir -p "${pkgdir}/usr/share/fonts/Webfonts/"
    cd "${srcdir}"
    install -Dm644 fonts/otf/* "${pkgdir}/usr/share/fonts/OTF/"
    install -Dm644 fonts/ttf/* "${pkgdir}/usr/share/fonts/TTF/"
    install -Dm644 fonts/variable/* "${pkgdir}/usr/share/fonts/Variable/"
    install -Dm644 fonts/webfonts/* "${pkgdir}/usr/share/fonts/Webfonts/"
}
