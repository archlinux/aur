# $Id$
# Maintainer:  Radu Potop <radu at wooptoo dot com>

pkgname=lora-font-git
pkgver=3.000
pkgrel=1
pkgdesc='Contemporary serif font that supports Latin and Cyrillic scripts. Includes OTF, TTF and VF variants.'
arch=('any')
url="https://github.com/cyrealtype/Lora-Cyrillic"
license=('OFL')
source=(
    "git+${url}.git"
)
sha256sums=(
    'SKIP'
)

package() {
    cd "${srcdir}/Lora-Cyrillic"
    mkdir -p "${pkgdir}/usr/share/fonts/OTF/"
    mkdir -p "${pkgdir}/usr/share/fonts/TTF/"
    mkdir -p "${pkgdir}/usr/share/fonts/OTVF/"
    install -Dm644 fonts/otf/* "${pkgdir}/usr/share/fonts/OTF/"
    install -Dm644 fonts/ttf/* "${pkgdir}/usr/share/fonts/TTF/"
    install -Dm644 fonts/vf/* "${pkgdir}/usr/share/fonts/OTVF/"
}
