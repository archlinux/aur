# Maintainer: Runnytu < runnytu at gmail.com >

pkgname=grub-hook
pkgver=2.0
pkgrel=1
pkgdesc="Pacman hook to update GRUB after a kernel update"
arch=('any')
url="https://wiki.archlinux.org/index.php/User:Allan/Pacman_Hooks"
license=('GPL')
depends=('grub')
install=${pkgname}.install
source=("grub.hook")
sha512sums=('995babe0658b31ded08d356fb3dcc31d95b2a3b500c65260773838825928b0fbf08b508dbe6ecc12b6b9d51e2d897ac3ee881edf68a2175fd169e554bfe54910')

package() {
  install -m755 -d "${pkgdir}/etc/pacman.d/hooks"
  install -m644 "${srcdir}/grub.hook" "${pkgdir}/etc/pacman.d/hooks/grub.hook"
}

