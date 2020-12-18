# Maintainer: Zhang.j.k <zhangjk67@gmail.com>

pkgname=cyberpunk-grub-theme-git
# _pkgname=cyberpunk
pkgver=1.0
pkgrel=1
pkgdesc="A GRUB Bootloader Theme Inspired by Cyberpunk 2077 Video Game."
url='https://github.com/anoopmsivadas/Cyberpunk-GRUB-Theme'
arch=('any')
license=('CCPL')
depends=('grub')
install=${pkgname}.install
source=("${pkgname}"::"git+https://github.com/anoopmsivadas/Cyberpunk-GRUB-Theme")
md5sums=('SKIP')

package() {
  cd "${srcdir}"
  find . -type f -exec install -D -m644 {} ${pkgdir}/boot/grub/themes/{} \;
#   install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

