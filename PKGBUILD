# Maintainer: Runnytu < runnytu at gmail.com >

pkgname=grub-hook
pkgver=2.0
pkgrel=2
pkgdesc="Pacman hook to update GRUB after a kernel update"
arch=('any')
url="https://wiki.archlinux.org/index.php/User:Allan/Pacman_Hooks"
license=('GPL')
depends=('grub')
install=${pkgname}.install
source=(grub.hook
	grub.sh)
sha512sums=('aafa69a759035167d38e47161f623f863af70e05cdea3edc218e198406a2392bfa2b33f27464c7d2c24fa0da351c81ff6abd3eb7720b769297e70598c26495ff'
'710f9e42d3c97a1a0ccfc54f0e38e060f48669c03b184a623b39a248af975938bbf9e65a22482874c6dacf660a657fb316d1f242b2f068ccb4822c4a79f6a718')

package() {
  install -m755 -d "${pkgdir}/etc/pacman.d/hooks"
  install -m644 "${srcdir}/grub.hook" "${pkgdir}/etc/pacman.d/hooks/grub.hook"
  install -m644 "${srcdir}/grub.sh" "${pkgdir}/etc/pacman.d/hooks/grub.sh"
}

