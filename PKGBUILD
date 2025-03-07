# Maintainer : kStor2poche <kStor2poche [at] orange [dot] fr>
_fontname="phosphor-icons"
pkgname="ttf-${_fontname}"
pkgver="2.1.1"
pkgrel=1
pkgdesc="A flexible icon family for interfaces, diagrams, presentations — whatever, really."
arch=("any")
url="https://phosphoricons.com"
license=("MIT")

source=("${_fontname}-${pkgver}.zip"::"https://github.com/${_fontname}/web/archive/refs/tags/v${pkgver}.zip")
sha256sums=("fbb74aa63a65c74c5da2c35ac9c9d33584f96e5d0f13a02b54ee6e0093a7469d")

package() {
    install -Dm644 "web-${pkgver}/src"/*/*.ttf -t "${pkgdir}/usr/share/fonts/TTF/"
    install -Dm644 "web-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
