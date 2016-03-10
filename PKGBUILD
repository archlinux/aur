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
sha512sums=('c563371f2df63cbf4b20ac96a778fc675d1601de9fa88751dc255303a9f87942556f5d764b4f69b38c987869cd2d0db4ec1c907c4e7ef3a7106a4ea471d088e5')

package() {
  install -m755 -d "${pkgdir}/etc/pacman.d/hooks"
  install -m644 "${srcdir}/grub.hook" "${pkgdir}/etc/pacman.d/hooks/grub.hook"
}

