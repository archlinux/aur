# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>
# Contributor: Radu Potop <radu at wooptoo dot com> 

_gitname=Lora-Cyrillic
_author=cyrealtype
_auxname=lora-font
pkgname=("${_auxname}-git")
pkgver=r254.c11db343
pkgrel=2
pkgdesc='Contemporary serif font that supports Latin and Cyrillic scripts. Includes OTF, TTF and variable.'
arch=('any')
makedepends=('git')
url="https://github.com/${_author}/${_gitname}"
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
    mkdir -p "${pkgdir}/usr/share/fonts/Variable/"
    install -Dm644 fonts/otf/* "${pkgdir}/usr/share/fonts/OTF/"
    install -Dm644 fonts/variable/* "${pkgdir}/usr/share/fonts/Variable/"
}
