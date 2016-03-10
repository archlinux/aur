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
sha512sums=('f9bf9a46e008d746c2a12b2974b13d13d9f84dd3bd2427597d428babdb5b4458b9117806b007b4102af131eb13d372c0d6f4dd63f2aeb1720a013b1ac66f1d4a')

package() {
  install -m755 -d "${pkgdir}/etc/pacman.d/hooks"
  install -m644 "${srcdir}/grub.hook" "${pkgdir}/etc/pacman.d/hooks/grub.hook"
}

