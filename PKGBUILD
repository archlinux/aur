# Maintainer: Serhii <serhiidev88@gmail.com>
pkgname=manjaro-gaming-control-bin
pkgver=1.0.0
pkgrel=3
pkgdesc="Exclusive optimization and hardware control utility for Manjaro Linux gamers."
arch=('x86_64')
url="https://github.com/serhiidev88/ManjaroGamingControl"
license=('GPL-3.0-or-later')
depends=('polkit' 'gamemode' 'mangohud')
optdepends=('nvidia-utils: for NVIDIA GPU temperature and driver monitoring') 
provides=('manjaro-gaming-control')
conflicts=('manjaro-gaming-control')

source=("https://github.com/serhiidev88/ManjaroGamingControl/releases/download/v${pkgver}/ManjaroGamingControl"
        "https://raw.githubusercontent.com/serhiidev88/ManjaroGamingControl/main/manjaro-gaming-control.desktop"
        "https://raw.githubusercontent.com/serhiidev88/ManjaroGamingControl/main/icon.png")

sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
    install -Dm755 "${srcdir}/ManjaroGamingControl" "${pkgdir}/usr/bin/manjaro-gaming-control"
    install -Dm644 "${srcdir}/manjaro-gaming-control.desktop" "${pkgdir}/usr/share/applications/manjaro-gaming-control.desktop"
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/manjaro-gaming-control.png"
}
