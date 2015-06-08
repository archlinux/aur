# Maintainer: Runnytu < runnytu at gmail.com >
 
pkgname=grub-hook
pkgver=1.0
pkgrel=1
pkgdesc="Pacman hook to update GRUB after a kernel update"
arch=('any')
url="https://wiki.archlinux.org/index.php/User:Allan/Pacman_Hooks"
license=('GPL')
depends=('grub')
install=${pkgname}.install
source=("grub")
md5sums=('09a78aa2ecc1e3f5889aff1765453adb')

package() {
  install -m755 -d "${pkgdir}/usr/lib/initcpio/install"
  install -m644 "${srcdir}/grub" "${pkgdir}/usr/lib/initcpio/install/grub"
}
