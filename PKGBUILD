# Maintainer: Dhruva Sambrani <dhruvasambrani19[at]gmail[dot]com>

pkgname=teams-for-linux-wayland-hook
pkgver=2
pkgrel=1
pkgdesc="Pacman hook to change teams-for-linux to start with electron flags to start with wayland after install or upgrade."
arch=("any")
install=teams-for-linux-wayland-hook.install
license=("MIT")
depends=('teams-for-linux')
source=(teams-for-linux-wayland.hook teams-for-linux-wayland)
sha1sums=('929fea9c7e64cf4d1de78277df852fdeb99597fd'
          '388d15eab9007f8a593b46dde9ee5eb340b6c028')

package() {
    install -m755 -d "${pkgdir}/usr/share/libalpm/hooks"
    install -m644 "${srcdir}/teams-for-linux-wayland.hook" "${pkgdir}/usr/share/libalpm/hooks/teams-for-linux-wayland.hook"
    install -m755 -d "${pkgdir}/usr/share/libalpm/scripts"
    install -m755  "${srcdir}/teams-for-linux-wayland" "${pkgdir}/usr/share/libalpm/scripts/teams-for-linux-wayland" 
}
