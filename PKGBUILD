# Maintainer: Emanuel Serpa <emanuelvserpa@gmail.com>

pkgname=discord-canary-wayland-hook
pkgver=2
pkgrel=1
pkgdesc="Pacman hook to change discord-canary to start with ozone-platform-hint=auto after install or upgrade."
arch=("any")
install=discord-canary-wayland-hook.install
license=("MIT")
depends=('discord-canary')
source=(discord-canary-wayland.hook discord-canary-wayland)
sha1sums=('6572182ccda6e3f5a413676f91a4d5056f77e5d7'
          '41d08812a7e3650b2824b44c32971a44cfb57bd1')

package() {
    install -m755 -d "${pkgdir}/usr/share/libalpm/hooks"
    install -m644 "${srcdir}/discord-canary-wayland.hook" "${pkgdir}/usr/share/libalpm/hooks/discord-canary-wayland.hook"
    install -m755 -d "${pkgdir}/usr/share/libalpm/scripts"
    install -m755  "${srcdir}/discord-canary-wayland" "${pkgdir}/usr/share/libalpm/scripts/discord-canary-wayland" 
}
