# Maintainer: Aethar <elliott.ashby88@gmail.com>

pkgname=steam-big-picture-session
pkgver=0.0.1
pkgrel=3
pkgdesc="A gamescope session for Steam Big Picture mode straight from the display manager"
arch=(any)
url="https://github.com/Aethar01/steam-big-picture-session"
license=('NONE')
source=("git+${url}.git")
depends=('gamescope' 'steam')
sha256sums=('SKIP')

package() {
    cd "${srcdir}" || exit
    cd steam-big-picture-session || exit
    install -Dm644 "steam-big-picture.desktop" "${pkgdir}/usr/share/wayland-sessions/steam-big-picture.desktop"
}
