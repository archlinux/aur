# Maintainer: Emanuel Serpa <emanuelvserpa@gmail.com>

pkgname=heroic-games-launcher-bin-wayland-hook
pkgver=1
pkgrel=1
pkgdesc="Pacman hook to change heroic-games-launcher-bin to start with ozone-platform-hint=auto after install or upgrade."
arch=("any")
install=heroic-games-launcher-bin-wayland-hook.install
license=("MIT")
depends=('heroic-games-launcher-bin')
source=(heroic-games-launcher-bin-wayland.hook heroic-games-launcher-bin-wayland)
sha1sums=('78bc217a87bb5de50d72b6344e5ac436c73a87e8'
          'ade5124066a11b3444f4b09101fc9ad22edfeeb5')

package() {
    install -m755 -d "${pkgdir}/usr/share/libalpm/hooks"
    install -m644 "${srcdir}/heroic-games-launcher-bin-wayland.hook" "${pkgdir}/usr/share/libalpm/hooks/heroic-games-launcher-bin-wayland.hook"
    install -m755 -d "${pkgdir}/usr/share/libalpm/scripts"
    install -m755  "${srcdir}/heroic-games-launcher-bin-wayland" "${pkgdir}/usr/share/libalpm/scripts/heroic-games-launcher-bin-wayland" 
}
