# Maintainer: Dhruva Sambrani <dhruvasambrani19[at]gmail[dot]com>

pkgname=altus-appimage-wayland-hook
pkgver=1
pkgrel=1
pkgdesc="Pacman hook to change altus-appimage to start with electron flags to start with wayland after install or upgrade."
arch=("any")
install=altus-appimage-wayland-hook.install
license=("MIT")
depends=('altus-appimage')
source=(altus-appimage-wayland.hook altus-appimage-wayland)
sha1sums=('1d16dd32583e56787a7cf63ff294402512caac32'
          'da5d9445d3a83a12e1bc3caf42f7a3b983eac28d')

package() {
    install -m755 -d "${pkgdir}/usr/share/libalpm/hooks"
    install -m644 "${srcdir}/altus-appimage-wayland.hook" "${pkgdir}/usr/share/libalpm/hooks/altus-appimage-wayland.hook"
    install -m755 -d "${pkgdir}/usr/share/libalpm/scripts"
    install -m755  "${srcdir}/altus-appimage-wayland" "${pkgdir}/usr/share/libalpm/scripts/altus-appimage-wayland" 
}
