# Maintainer: Runnytu < runnytu at gmail.com >

pkgname=grub-hook
pkgver=2.1
pkgrel=1
pkgdesc="Pacman hook to update GRUB after a kernel update"
arch=('any')
url="https://wiki.archlinux.org/index.php/Pacman#Hooks"
license=('GPL')
depends=('grub')
source=(grub.hook)
sha512sums=('7619f00afda5d061130d87ceb6f44196131a40d077a22ee67176098e7c1bcab2bec6732c6ed6b45d2f7bc29033fbbab8139521550b47595311ff7f6049073ce3')

package() {
  install -m755 -d "${pkgdir}/usr/share/libalpm/hooks"
  install -m644 "${srcdir}/grub.hook" "${pkgdir}/usr/share/libalpm/hooks/grub.hook"
}

