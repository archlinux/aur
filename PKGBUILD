# Maintainer: Runnytu < runnytu at gmail.com >

pkgname=grub-hook
pkgver=2.0
pkgrel=5
pkgdesc="Pacman hook to update GRUB after a kernel update"
arch=('any')
url="https://wiki.archlinux.org/index.php/User:Allan/Pacman_Hooks"
license=('GPL')
depends=('grub')
install=${pkgname}.install
source=(grub.hook)
sha512sums=('7414092e8dff88b6f1767042edc2d251348a6ea068fe30139790fd9c940a2b71499e71f45be60125e2185ff7fcf8ae1e668a2e8ed41063ed25ba99bdc47a680a')

package() {
  install -m755 -d "${pkgdir}/etc/pacman.d/hooks"
  install -m644 "${srcdir}/grub.hook" "${pkgdir}/etc/pacman.d/hooks/grub.hook"
}

