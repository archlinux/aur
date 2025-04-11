# Maintainer : kStor2poche <kStor2poche [at] orange [dot] fr>
_fontname="phosphor-icons"
pkgname="ttf-${_fontname}"
pkgver="2.1.2"
pkgrel=1
pkgdesc="A flexible icon family for interfaces, diagrams, presentations — whatever, really."
arch=("any")
url="https://phosphoricons.com"
license=("MIT")

source=("${_fontname}-${pkgver}.zip"::"https://github.com/${_fontname}/web/archive/refs/tags/v${pkgver}.zip")
sha256sums=("166c6aa03a64692ed8401c40e51e3b66925d6ea6cbd4ae447699e88dc7c00e60")

package() {
    install -Dm644 "web-${pkgver}/src"/*/*.ttf -t "${pkgdir}/usr/share/fonts/TTF/"
    install -Dm644 "web-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
