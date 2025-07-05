# Maintainer: Aethar <elliott.ashby88@gmail.com>

pkgname=steam-big-picture-session
pkgver=0.0.1
pkgrel=1
pkgdesc="A Wayland compositor for Steam Big Picture mode"
arch=(any)
license=('NONE')
source=('git+https://github.com/Aethar/steam-big-picture-session.git')
sha256sums=('SKIP')

package() {
    cd "${srcdir}" || exit
    install -Dm644 "steam-big-picture.desktop" "${pkgdir}/usr/share/wayland-sessions/steam-big-picture.desktop"
    isntall -Dm644 "steam-shutdown.desktop" "${pkgdir}/usr/share/applications/steam-shutdown.desktop"
}
