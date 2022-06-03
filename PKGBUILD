# Maintainer: Nyaacinth <nyaacinth_liota@outlook.com>
pkgname=synthv-studio-bin
pkgver=2
pkgrel=1
pkgdesc="Synthesizer V studio by Dreamtonics"
arch=("x86_64")
url="https://dreamtonics.com/synthesizerv"
license=(custom)
depends=("xdg-utils")
provides=("synthv-studio")
conflicts=()
source=("synthv-studio.sh"
        "synthv-studio.png"
        "synthv-studio.desktop"
        "info.txt")
sha256sums=("d9489e2e8a3c75e84e8d5a8c9eade3a68657f0f88e70899363882e456a7c1c48"
            "f0f0180bbd5a029655089c5f8d5948c093622dd978e8aa6a4c47689b5936351b"
            "710f95ca38ab0e69c0431feb7f323bf84b4b4b822248a465ed5e525b36070871"
            "912bc157e0bbebae3ff646c1f57cad7701be20759281c15e75fc201a46085e5c")

package() {
    install -Dm644 "${srcdir}/info.txt" "${pkgdir}/opt/synthv-studio/info.txt"
    install -Dm644 "${srcdir}/synthv-studio.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/synthv-studio.png"
    install -Dm755 "${srcdir}/synthv-studio.sh" "${pkgdir}/usr/bin/synthv-studio"
    install -Dm755 "${srcdir}/synthv-studio.desktop" "${pkgdir}/usr/share/applications/synthv-studio.desktop"
}
