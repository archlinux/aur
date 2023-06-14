# $Id$
# Maintainer:  Radu Potop <radu at wooptoo dot com>

pkgname=lora-cyrillic-font
pkgver=3.005
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
    install -Dm644 fonts/otf/* "${pkgdir}/usr/share/fonts/OTF/"
    install -Dm644 fonts/ttf/* "${pkgdir}/usr/share/fonts/TTF/"
    install -Dm644 fonts/variable/* "${pkgdir}/usr/share/fonts/Variable/"
    install -Dm644 fonts/webfonts/* "${pkgdir}/usr/share/fonts/Webfonts/"
}

sha256sums=('845821126d828b44b7125ba2d97d75ae39511d9c1b0fd1a1ef0ed3371be413e9')
