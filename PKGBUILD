# Maintainer: Enzo Queiroz Costa <enzo415611@gmail.com>
pkgname=linux-tool-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="AUR and Pacman package manager helper with Slint UI"
url="https://github.com/Enzo415611/linux-tool"
license=("GPL-3.0-only")
arch=("x86_64")
provides=("linux-tool")
conflicts=("linux-tool")
depends=("fontconfig" "libxkbcommon" "libxcb" "alsa-lib")  # adicionei alsa-lib, comum no Slint

# O binário está hospedado no GitHub Release (você já subiu lá)
source=("https://github.com/Enzo415611/linux-tool/releases/download/v${pkgver}/linux-tool-${pkgver}-x86_64.tar.gz")
sha256sums=("c49c0631616770b08539c0d0a19c5a5f5cc878c4d8e4350f3b1690cae90b42b3")

package() {
    cd "${srcdir}"

    # Binário principal
    install -Dm755 "linux-tool" "${pkgdir}/usr/bin/linux-tool"

    # Ícone (corrigido o caminho e nome)
    install -Dm644 "ui/assets/app-icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/linux-tool.png"


}
