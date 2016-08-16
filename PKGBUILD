# Maintainer: Runnytu < runnytu at gmail.com >

pkgname=grub-hook
pkgver=2.0
pkgrel=4
pkgdesc="Pacman hook to update GRUB after a kernel update"
arch=('any')
url="https://wiki.archlinux.org/index.php/User:Allan/Pacman_Hooks"
license=('GPL')
depends=('grub')
install=${pkgname}.install
source=(grub.hook)
sha512sums=('8cf9ddb209fcff7fa6a8a7a9c482b5dd61681835fdc784b0d291359357125572b6696b952d5ad87eccfff4b3e519843c7d39f654ed2283cd53ec5f5cdebbcf99')

package() {
  install -m755 -d "${pkgdir}/etc/pacman.d/hooks"
  install -m644 "${srcdir}/grub.hook" "${pkgdir}/etc/pacman.d/hooks/grub.hook"
}

