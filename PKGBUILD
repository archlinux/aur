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
sha512sums=('510bcb135556676748f38d30bd52e686fc6a3aad9d851a91b22ab9d64da308fdf0cdd53092499d3a8585bc595713ef5d36156fb280e7cfb3906c26bbdabf73f1')

package() {
  install -m755 -d "${pkgdir}/etc/pacman.d/hooks"
  install -m644 "${srcdir}/grub.hook" "${pkgdir}/etc/pacman.d/hooks/grub.hook"
}

