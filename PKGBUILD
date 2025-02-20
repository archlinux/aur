# Maintainer : kStor2poche <kStor2poche [at] orange [dot] fr>
_fontname="phosphor-icons"
pkgname="ttf-${_fontname}"
pkgver="2.1.0"
pkgrel=1
pkgdesc="A flexible icon family for interfaces, diagrams, presentations — whatever, really."
arch=("any")
url="https://phosphoricons.com"
license=("MIT")

source=("${_fontname}-${pkgver}.zip"::"https://github.com/${_fontname}/homepage/releases/download/v${pkgver}/${_fontname}.zip")
sha256sums=("d4dabb1e4c5aeb67ed67d9dc3f47d8b9e7c57cff37d9c35da75a1fc17eaa11ea")

package() {
    install -Dm644 "Fonts"/*/*.ttf -t "${pkgdir}/usr/share/fonts/TTF/"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
