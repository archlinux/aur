# Maintainer: Dhruva Sambrani <dhruvasambrani19[at]gmail[dot]com>

pkgname=joplin-beta-appimage-wayland-hook
pkgver=2
pkgrel=1
pkgdesc="Pacman hook to change joplin-beta-appimage to start with electron flags to start with wayland after install or upgrade."
arch=("any")
install=joplin-beta-appimage-wayland-hook.install
license=("MIT")
depends=('joplin-beta-appimage')
source=(joplin-beta-appimage-wayland.hook joplin-beta-appimage-wayland)
sha1sums=('d55e3b40ce9f2938b8faebcfa090416c92efa7e4'
          '4a67d353ff44b074cfa9d4e21b26d6f4eb481a65')

package() {
    install -m755 -d "${pkgdir}/usr/share/libalpm/hooks"
    install -m644 "${srcdir}/joplin-beta-appimage-wayland.hook" "${pkgdir}/usr/share/libalpm/hooks/joplin-beta-appimage-wayland.hook"
    install -m755 -d "${pkgdir}/usr/share/libalpm/scripts"
    install -m755  "${srcdir}/joplin-beta-appimage-wayland" "${pkgdir}/usr/share/libalpm/scripts/joplin-beta-appimage-wayland" 
}
